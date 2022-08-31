# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/boisv/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME=robbyrussell
#ZSH_THEME=cypher
#ZSH_THEME=spaceship
#ZSH_THEME=guezwhoz

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    autoupdate
    git 
#    colored-man-pages
    zsh-syntax-highlighting
    zsh-autosuggestions
)


source $ZSH/oh-my-zsh.sh

# User configuration
alias cp='cp -v'
alias mv='mv -iv'
alias cat='bat'
alias ls='lsd'
alias l='ls -l'
alias ll='ls -la'
alias la='ls -A'
alias bat='bat --theme=ansi'
less() {
    bat $1 -r $(wc -l $1 | awk -F ' ' '{print $1-10":"$1}')
}

# Trying to use homebrew's git instead of apple builtin
export PATH="/usr/local/bin:${PATH}"
export PATH="/usr/local/sbin:${PATH}"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fuzzy finder configuration
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
}
alias activate='source .venv/bin/activate'

# Go binairies to PATH
PATH="$HOME/go/bin:$PATH"
export GOPATH="$HOME/go"

# Java
export JAVA_HOME=$(/usr/libexec/java_home -v 11.0.10)

# Pyenv
export PATH="/Users/boisv/.pyenv/shims:${PATH}"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
#export PYENV_VIRTUALENV_DISABLE_PROMPT=1

alias pwgen='pwgen -s -c -n -y -1 20'

export PANDOC="/usr/local/bin/pandoc"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/boisv/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/boisv/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/boisv/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/boisv/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export SENTIMENT_INVESTOR='7F72661-YHF4RYP-HPAPYZS-0RSZENA'

export GEM_HOME="$HOME/.gem"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
