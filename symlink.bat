mklink %HOME%\.gitignore %CD%\gitignore
mklink %HOME%\_vimrc %CD%\vimrc
mklink %HOME%\_gvimrc %CD%\gvimrc
mkdir %HOME%\vimfiles
mkdir %HOME%\vimfiles\bundle
mkdir %HOME%\vimfiles\colors
mklink %HOME%\vimfiles\bundle\neobundle.vim %CD%\neobundle.vim 
mklink %HOME%\vimfiles\colors\wombat.vim %CD%\wombat.vim\colors\wombat.vim
