scriptencoding utf-8
" 初回導入時
" install or make : w3m,vimproc,
"

" coffeescript
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead Cakefile set filetype=coffee
autocmd BufNewFile,BufRead *.jade set filetype=jade

" viable 
autocmd BufNewFile,BufRead *viablerc set filetype=vim


colorscheme wombat

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

set number
set title
set cursorline
set hlsearch
set incsearch

"set lcs=tab:>.,eol:$,trail:_,extends:\
set lcs=tab:>.,trail:_,extends:\
set list
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END


syntax on
filetype indent on
filetype plugin on

" cut & paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" ノーマルモードで改行
noremap <CR> o<ESC>
noremap <S-CR> O<ESC>

" 新しいWindowを下、右に開く
set splitbelow
set splitright


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

  " project
  " NeoBundle 'vim-scripts/project.vim'
  " let loaded_project = 1
  NeoBundle 'Shougo/vimfiler'

  "memo"
  NeoBundle 'glidenote/memolist.vim'
  let g:memolist_path = "~/Dropbox/memo"
  let g:memolist_memo_suffix = "md"
  let g:memolist_memo_date = "%Y-%m-%d %H:%M"
  "let g:memolist_memo_date = "epoch"
  "let g:memolist_memo_date = "%D %T"
  let g:memolist_prompt_tags = 1
  let g:memolist_prompt_categories = 1
  "let g:memolist_qfixgrep = 1
  let g:memolist_vimfiler = 1
  "let g:memolist_template_dir_path = "path/to/dir"

  " coffee & jade
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'digitaltoad/vim-jade.git'

  " twitter
  " NeoBundle 'vim-scripts/TwitVim.git'

  " calendar
  NeoBundle 'mattn/calendar-vim.git'

  NeoBundle 'git@github.com:fukayatsu/vim-diary.git'

  " ime
  NeoBundle 'git@bitbucket.org:fukayatsu/vim-im-control.git'
  " 「日本語入力固定モード」切替キー
  " https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese/ime-control/ibus#TOC-IBus-Python-
  " inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
  " PythonによるIBus制御指定
"  let IM_CtrlIBusPython = 1


"VimFiler

  " キーマップ
  nnoremap <silent> vf :<C-u>VimFiler -buffer-name=explorer -split -winwidth=25 -toggle -no-quit<Cr>
 " デフォルトのファイラーに
  let g:vimfiler_as_default_explorer = 1
  " ファイル削除などを可能に
  let g:vimfiler_safe_mode_by_default = 0
  " 日時表示はなるべく短く
  let g:vimfiler_time_format = "%y-%m-%d %H:%M"
  " 表示設定
  let g:vimfiler_tree_leaf_icon = ' '
  let g:vimfiler_tree_opened_icon = '▾'
  let g:vimfiler_tree_closed_icon = '▸'
  let g:vimfiler_file_icon = '-'
  let g:vimfiler_marked_file_icon = '*'
  " システムのデフォルトの関連付けで開く
  call vimfiler#set_execute_file('bmp,jpg,png,gif,pdf', 'open')
  "nnoremap <silent> vf :<C-u>VimFilerSplit<CR>
  autocmd! FileType vimfiler call g:my_vimfiler_settings()
  function! g:my_vimfiler_settings()
    nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
    nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
    nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
  endfunction

  let my_action = { 'is_selectable' : 1 }
  function! my_action.func(candidates)
    wincmd p
    exec 'split '. a:candidates[0].action__path
  endfunction
  call unite#custom_action('file', 'my_split', my_action)

  let my_action = { 'is_selectable' : 1 }
  function! my_action.func(candidates)
    wincmd p
    exec 'vsplit '. a:candidates[0].action__path
  endfunction
  call unite#custom_action('file', 'my_vsplit', my_action)

" unite
  " 入力モードで開始する
  let g:unite_enable_start_insert=1
  " バッファ一覧
  " nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
  " ファイル一覧
  " nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
  " レジスタ一覧
  " nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
  " 最近使用したファイル一覧
  " nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
  " 常用セット
  " nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
  " 全部乗せ
  " nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

  " バッファ一覧
  noremap <C-P> :Unite buffer<CR>
  " ファイル一覧
  noremap <C-N> :Unite -buffer-name=file file<CR>
  " 最近使ったファイルの一覧
  noremap <C-Z> :Unite file_mru<CR>

  " 常用セット
  " noremap <C-M> :Unite file_mru buffer<CR>


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

" neocomplcache
  "前編"
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    let g:neocomplcache_enable_underbar_completion = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

  "中編"
    " Plugin key-mappings.
    imap <C-k>     <Plug>(neocomplcache_snippets_expand)
    smap <C-k>     <Plug>(neocomplcache_snippets_expand)
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " SuperTab like snippets behavior.
    "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()

    " AutoComplPop like behavior.
    let g:neocomplcache_enable_auto_select = 0

  "後編"
  " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplcache_enable_auto_select = 1
    "let g:neocomplcache_disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
    "inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
    "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
