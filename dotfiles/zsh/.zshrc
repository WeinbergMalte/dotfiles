# ZSH Powerlevel10k setup
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

plugins=(git poetry colored-man-pages colorize brew helm kubectl poetry zsh-autosuggestions zsh-syntax-highlighting)
complete -C aws_completer aws

# User configuration
export PATH="$HOME/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="/Users/$USER/.local/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#### Aliases: ####
# proxies:
alias unsetproxies="unset HTTP_PROXY HTTPS_PROXY http_proxy https_proxy"
# terminal:
alias srz="source ~/.zshrc"
# list:
alias ls="ls -CF --color=auto"
alias ll="ls -lha"
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"
# folders:
alias cdd="cd ../.."
alias cddd="cd ../../.."
# typos:
alias cd..="cd .."
alias sl="ls"
# shortening:
alias c="clear"
alias h="history"
# sudo:
alias root="sudo -i"
alias su="sudo -i"
# grep:
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias grepi="grep -ri"
alias greph="grep -ri --exclude-dir='.*'"
alias gn="grep -ri --exclude='*.ipynb'"
# git:
alias gdd="git add"
alias glg="git log --oneline --decorate --graph --all"
alias gst="git status"
alias gco="git checkout"
alias gcm="git commit"
# jupyter:
alias jpn="jupyter notebook &"
alias jpl="jupyter lab &"
alias jpx="jupyter lab --no-browser"
# vscode:
alias codei="code --ignore-certificate-errors"
# vim:
alias vim="nvim"
alias vi="nvim"
# misc:
alias df="df -Tha --total"
alias du="du -ach | sort -h"
alias untar="tar -zxvf "
alias sha="shasum -a 256 "
alias ipi="ipconfig getifaddr en0"
