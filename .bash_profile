NVM=v0.6.12
source ~/.nvm/nvm.sh
nvm use $NVM
alias coffee=~/.nvm/$NVM/lib/node_modules/coffee-script/bin/coffee
alias cake=~/.nvm/$NVM/lib/node_modules/coffee-script/bin/cake
unset NVM

alias ll='ls -a -l'
alias gvim='mvim'
alias adb='/Developer/android-sdk-macosx/platform-tools/adb'

# git
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

#rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
