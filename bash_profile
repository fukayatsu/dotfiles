#alias ll='ls -a -l'
alias gvim='mvim'

#development
alias amb='~/deka/amb'
#alias cdadmin='cd ~/deka/community/amebasocial-node/admin'
alias cadmin='cd ~/deka/community/amebame-admin'

#android
#alias adb='/Developer/android-sdk-macosx/platform-tools/adb'

#node.js
source ~/.nvm/nvm.sh

# git
source /usr/local/etc/bash_completion.d/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

#rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

#brew
PATH=/usr/local/bin:/usr/local/share:$PATH
export PATH
