export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

# homebrew
export PATH=/usr/local/bin:$PATH

# node.js
export PATH=$HOME/.nodebrew/current/bin:$PATH

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# postgres
export PGDATA=/usr/local/var/postgres

## vim
# bindkey -v

## 補完機能の強化
autoload -U compinit
compinit

## プロンプトの設定
autoload colors
colors

# case ${UID} in
# 0)
#   PROMPT="[%{${fg[blue]}%}%n@%m%{${reset_color}%}] %{${fg[blue]# }%}#%{${reset_color}%} "
#   PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
#   SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]# :%{${reset_color}%}%b "
#   RPROMPT="%{${fg[blue]}%}[%/]%{${reset_color}%}"
#   ;;
# *)
#   PROMPT="[%n@%m] %{${fg[blue]}%}$%{${reset_color}%} "
#   PROMPT2="%B%{${fg[blue]}%}%_$%{${reset_color}%}%b "
#   SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]# :%{${reset_color}%}%b "
#   RPROMPT="%{${fg[blue]}%}[%/]%{${reset_color}%}"
#   ;;
# esac


#
# Show branch name in Zsh's right prompt
#

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

setopt prompt_subst
setopt re_match_pcre

function rprompt-git-current-branch {
        local name st color gitdir action
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
                return
        fi
        name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
        if [[ -z $name ]]; then
                return
        fi

        gitdir=`git rev-parse --git-dir 2> /dev/null`
        action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

        st=`git status 2> /dev/null`
  if [[ "$st" =~ "(?m)^nothing to" ]]; then
                color=%F{green}
  elif [[ "$st" =~ "(?m)^nothing added" ]]; then
                color=%F{yellow}
  elif [[ "$st" =~ "(?m)^# Untracked" ]]; then
                color=%B%F{red}
        else
                 color=%F{red}
         fi


        echo "$color$name$action%f%b "
}

RPROMPT='[`rprompt-git-current-branch`%~]'
chpwd() {
    local CMD_LS="ls -a -v -F"
    case "${OSTYPE}" in
        freebsd*|darwin*)
            # -G カラー表示
            # -F ファイルタイプを示す文字を表示
            if type gls > /dev/null 2>&1; then
                # -v natural sort of (version) numbers within text
                CMD_LS="gls -avF --color"
            else
                # -v 非印字文字を強制表示
                CMD_LS="ls -avGF"
            fi
            ;;
        linux*)
            # -v natural sort of (version) numbers within text
            # -w 非印字文字を強制表示
            CMD_LS="ls -avwF --color"
            ;;
    esac
    # ファイル数が多い場合は表示するファイルを制限
    if [ 150 -le $(\ls -A |wc -l) ]; then
        eval "$CMD_LS" -C | head -n 5
        echo '...'
        eval "$CMD_LS" -C | tail -n 5
        echo "$(\ls -A | wc -l | tr -d ' ') files exist"
    else
        eval "$CMD_LS"
    fi
    # cdd
    type _cdd_chpwd >/dev/null 2>&1 && _cdd_chpwd
}

## コアダンプサイズを制限
limit coredumpsize 102400

## 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr

## 色を使う
setopt prompt_subst

## ビープを鳴らさない
setopt nobeep

## 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs

## 補完候補一覧でファイルの種別をマーク表示
setopt list_types

## サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume

## 補完候補を一覧表示
setopt auto_list

## 補完候補を詰めて表示
setopt list_packed

## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

## cd 時に自動で push
setopt autopushd

## 同じディレクトリを pushd しない
setopt pushd_ignore_dups

## ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob

## TAB で順に補完候補を切り替える
setopt auto_menu

## zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt extended_history

## =command を command のパス名に展開する
setopt equals

## --prefix=/usr などの = 以降も補完
setopt magic_equal_subst

## ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify

# ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort

## 出力時8ビットを通す
setopt print_eight_bit

## ヒストリを共有
setopt share_history

## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1

## 補完候補の色づけ
#eval `dircolors`
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## ディレクトリ名だけで cd
setopt auto_cd

## カッコの対応などを自動的に補完
setopt auto_param_keys

## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

## スペルチェック
setopt correct

## エイリアス
setopt complete_aliases

case "${OSTYPE}" in
freebsd*|darwin*)
alias ls="ls -G -w"
;;
linux*)
alias ls="ls --color"
;;
esac
alias la="ls -al"
alias lf="ls -F"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"

alias lastcmd="fc -ln -1 | tr -d '\n' | pbcopy"

alias xubl='xargs subl'

alias rake='noglob rake'
alias octonew="~/github/octopress/octonew"

# alias gitk='gitk 2>/dev/null'
alias gitk=gitx

alias git-comp="git checkout master && git pull"
alias gitdb-local="git-comp && git branch --merged | grep -v 'master' | xargs git branch -d"
alias gitdb-track="git-comp && git branch -r --merged | grep -v 'master' | xargs git branch -r -d"
alias gitdb-remote="git-comp && git branch -a --merged | grep -v 'master' | grep remotes/origin | sed -e 's% *remotes/origin/%%' | xargs -I% git push origin :%
"

alias githook-test-push="git commit --amend --no-edit; git push --force"

#alias irb=pry

alias be="bundle exec"
alias bi="bundle install"
alias bi-path="bi --path=vendor/bundler"

alias xphp="/Applications/XAMPP/xamppfiles/bin/php"
alias xmysql="/Applications/XAMPP/xamppfiles/bin/mysql"
alias xmysqladmin="/Applications/XAMPP/xamppfiles/bin/mysqladmin"

## 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash

## 検索
export TEXT_BROWSER=w3m

function _space2p20
{
    echo $@ |sed -e "s/ /%20/g"
}

function _space2plus
{
    echo $@ | sed -e "s/ /+/g"
}

function google
{
    ${TEXT_BROWSER} "http://www.google.co.jp/search?q="`_space2plus $@`"&hl=ja"
}

function ydic
{
    ${TEXT_BROWSER} "http://dic.yahoo.co.jp/dsearch?enc=UTF-8&p="`_space2plus $@`"&stype=0&dtyp
e=2"
}

function technorati
{
    ${TEXT_BROWSER} http://www.technorati.com/search/`_space2p20 $@`"?language=ja"
}

function wikipedia
{
    ${TEXT_BROWSER} http://ja.wikipedia.org/wiki/`_space2p20 $@`
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### lolcommits
export LOLCOMMITS_FONT="/Library/Fonts/ヒラギノ角ゴ Std W8.otf"

# ローカル固有の設定
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

_Z_CMD=j
. /usr/local/etc/profile.d/z.sh
function precmd () {
_z --add "$(pwd -P)"
}
