#alias ll='ls -a -l'
alias gvim='mvim'

#android
#alias adb='/Developer/android-sdk-macosx/platform-tools/adb'

#node.js
source ~/.nvm/nvm.sh

# git
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

#rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

#brew
PATH=/usr/local/bin:/usr/local/share:$PATH
export PATH
