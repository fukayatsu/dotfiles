colorscheme wombat

set guioptions-=T
set guioptions-=m

if has('gui_macvim')
  set guifont=Monaco:h18
  set guifontwide=Monaco:h18
elseif has('gui_gtk2')
  set guifont=Inconsolata\ 18
  set guifontwide=Takao\ 18
endif

set antialias
