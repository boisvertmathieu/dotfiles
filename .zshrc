# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/boisv/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME=robbyrussell
#ZSH_THEME=cypher
#ZSH_THEME=spaceship

plugins=(
    git 
    colored-man-pages
    zsh-syntax-highlighting
    zsh-autosuggestions
)


# Disable insecure completion-dependent directories detection
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# User configuration
alias cp='cp -v'
alias mv='mv -iv'
alias cat='bat'
alias ls='lsd'
alias l='ls -F'
alias ll='ls -l'
alias lla='ls -la'
alias la='ls -A'
alias bat='bat --theme=ansi'
less() {
    bat $1 -r $(wc -l $1 | awk -F ' ' '{print $1-10":"$1}')
}


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fuzzy finder configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Custom command for creating and entering into created directory
mkcd() {
  mkdir "$1"
  cd "$1"
}

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Python virtualenv
venv() {
  python3 -m venv .venv
# source .venv/bin/activate  # commented out by conda initialize
}
alias activate='source .venv/bin/activate'

# Go binairies to PATH
PATH="$HOME/go/bin:$PATH"
export GOPATH="$HOME/go"

# Pyenv
export PATH="/Users/boisv/.pyenv/shims:${PATH}"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Trying to use homebrew's git instead of apple builtin
export PATH="/usr/local/bin:${PATH}"
export PATH="/usr/local/sbin:${PATH}"

timezsh() {
    shell=${1-$SHELL}
    for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
