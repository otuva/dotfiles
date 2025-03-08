###############################
#   _____    _                #
#  |__  /___| |__  _ __ ___   #
#    / // __| '_ \| '__/ __|  #
#   / /_\__ \ | | | | | (__   #
#  /____|___/_| |_|_|  \___|  #
#                             #
###############################

# ------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------zshrc----------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------------------

# ------------------------------------------------------------
# -------------------------oh-my-zsh--------------------------
# ------------------------------------------------------------

OHMYZSH=$ZDOTDIR/ohmyzsh # Path to your oh-my-zsh installation.

ZSH_THEME="agnoster" # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

HYPHEN_INSENSITIVE="true" # hyphen-insensitive completion. _ and - will be interchangeable.

COMPLETION_WAITING_DOTS="true" # display red dots whilst waiting for completion.

plugins=() # Standard plugins can be found in $ZSH/plugins/

HISTSIZE=999999999

SAVEHIST=$HISTSIZE

# ------------------------------------------------------------
# -------------------------functions--------------------------
# ------------------------------------------------------------

wayback()
{
  spn -a "$(secret-tool lookup wayback accesskey):$(secret-tool lookup wayback secretkey)" "$1"
}

cheat()
{
  curl -Ls "https://cheat.sh/$1"
}

# ------------------------------------------------------------
# ---------------------------check----------------------------
# ------------------------------------------------------------

ZSH_CACHE_DIR="$HOME/.cache/oh-my-zsh"
if [[ ! -d "$ZSH_CACHE_DIR" ]]; then # create cache dir
  mkdir "$ZSH_CACHE_DIR"
fi

if [[ -d "$HOME/.local/bin" ]]; then # add local bin to path
  PATH="$HOME/.local/bin:$PATH"
fi

# ------------------------------------------------------------
# ---------------------------source---------------------------
# ------------------------------------------------------------

source $OHMYZSH/oh-my-zsh.sh
source $ZDOTDIR/ext/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/ext/zsh-autosuggestions/zsh-autosuggestions.zsh

# ------------------------------------------------------------
# -----------------------export-&-alias-----------------------
# ------------------------------------------------------------

alias cp="cp -i"
alias free='free -m'
alias gitvisual="git log --graph --decorate --oneline"
alias ip="ip -c -h -p"
alias random-string="openssl rand -base64 16"
alias rm="rm -I"
alias wget="wget --hsts-file=${XDG_DATA_HOME}/wget-hsts"
export EDITOR='/usr/bin/nano'
export GPG_TTY=$(tty)

# ------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------crhsz----------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------------------
