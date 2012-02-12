" 初回導入時
" install or make : w3m,vimproc, 
"

" coffeescript
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead Cakefile set filetype=coffee

colorscheme wombat
set tabstop=2
set shiftwidth=2
set softtabstop=0
set autoindent
set smartindent

set number
set title
set cursorline

syntax on
filetype indent on
filetype plugin on



" プラグインの設定
set nocompatible               " be iMproved
  filetype plugin indent off     " required!
  
  if has('vim_starting')
     set runtimepath+=~/.vim/bundle/neobundle.vim/
     call neobundle#rc(expand('~/.vim/bundle/'))
   endif
  " let NeoBundle manage NeoBundle
  " required! 
  NeoBundle 'Shougo/neobundle.vim'
  " recommended to install
  NeoBundle 'Shougo/vimproc'
  NeoBundle 'Shougo/neocomplcache'
  " after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
  NeoBundle 'Shougo/vimshell'
  NeoBundle 'Shougo/unite.vim'

  NeoBundle 'thinca/vim-ref'
  NeoBundle 'thinca/vim-quickrun'

	NeoBundle 'kchmck/vim-coffee-script'

" unite
  " 入力モードで開始する
  let g:unite_enable_start_insert=1
  " バッファ一覧
  noremap <C-P> :Unite buffer<CR>
  " ファイル一覧
  noremap <C-N> :Unite -buffer-name=file file<CR>
  " 最近使ったファイルの一覧
  noremap <C-Z> :Unite file_mru<CR>
  " ウィンドウを分割して開く
  au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
  au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
  " ウィンドウを縦に分割して開く
  au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
  au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
  " ESCキーを2回押すと終了する
  au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
  au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
  " 初期設定関数を起動する
  au FileType unite call s:unite_my_settings()
  function! s:unite_my_settings()
    " Overwrite settings.
  endfunction
  " 様々なショートカット
  call unite#set_substitute_pattern('file', '\$\w\+', '\=eval(submatch(0))', 200)
  call unite#set_substitute_pattern('file', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/"', 2)
  call unite#set_substitute_pattern('file', '^@', '\=getcwd()."/*"', 1)
  call unite#set_substitute_pattern('file', '^;r', '\=$VIMRUNTIME."/"')
  call unite#set_substitute_pattern('file', '^\~', escape($HOME, '\'), -2)
  call unite#set_substitute_pattern('file', '\\\@<! ', '\\ ', -20)
  call unite#set_substitute_pattern('file', '\\ \@!', '/', -30)
  if has('win32') || has('win64')
    call unite#set_substitute_pattern('file', '^;p', 'C:/Program Files/')
    call unite#set_substitute_pattern('file', '^;v', '~/vimfiles/')
  else
    call unite#set_substitute_pattern('file', '^;v', '~/.vim/')
  endif
