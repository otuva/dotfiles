###############################
#   _____    _                #
#  |__  /___| |__  _ __ ___   #
#    / // __| '_ \| '__/ __|  #
#   / /_\__ \ | | | | | (__   #
#  /____|___/_| |_|_|  \___|  #
#                             #
###############################

# ------------------------------------------------------------
# -------------------------oh-my-zsh--------------------------
# ------------------------------------------------------------

ZSH=/usr/share/oh-my-zsh # Path to your oh-my-zsh installation.

ZSH_THEME="agnoster" # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

HYPHEN_INSENSITIVE="true" # hyphen-insensitive completion. _ and - will be interchangeable.

COMPLETION_WAITING_DOTS="true" # display red dots whilst waiting for completion.

plugins=(git) # Standard plugins can be found in $ZSH/plugins/

# ------------------------------------------------------------
# -------------------------functions--------------------------
# ------------------------------------------------------------

autoremove() 
{
    yay -R $(yay -Qdtq)
}

wayback()
{
    spn -a "$(secret-tool lookup wayback accesskey):$(secret-tool lookup wayback secretkey)" "$1"
}

# ------------------------------------------------------------
# ---------------------------cache----------------------------
# ------------------------------------------------------------

ZSH_CACHE_DIR="$HOME/.cache/oh-my-zsh"
if [[ ! -d "$ZSH_CACHE_DIR" ]]; then
  mkdir "$ZSH_CACHE_DIR"
fi

# ------------------------------------------------------------
# ---------------------------source---------------------------
# ------------------------------------------------------------

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ------------------------------------------------------------
# -----------------------export-&-alias-----------------------
# ------------------------------------------------------------

export EDITOR='vim'
export GPG_TTY=$(tty)

alias up="yay -Syu"
alias ip="ip -c -h -p"
alias cp="cp -i"                                # confirm before overwriting something
alias rm="rm -I"                                # confirm before f-up
alias free='free -m'                            # show sizes in mb
alias gitvisual="git log --graph --decorate --oneline"
alias random-string="openssl rand -base64 16"

alias ls="exa"
alias df="duf"
alias cat="bat"
alias grep="rg"
alias find="fd"
alias wget="wget --hsts-file=${XDG_DATA_HOME}/wget-hsts"
alias docker="sudo docker"

# ------------------------------------------------------------
# -------------------------end-zshrc--------------------------
# ------------------------------------------------------------