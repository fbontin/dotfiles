# For testing startup performance, enable the line below and the line at the end of this file
# zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH=/Users/filipbontin/.oh-my-zsh


# Only load zcompdump cache once a day to speed up start times for zsh
autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

eval $(thefuck --alias)

source $ZSH/oh-my-zsh.sh

# export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"
export NVM_DIR="$HOME/.nvm"
. "$HOME/.nvm/nvm.sh"

# User configuration
LANG=en_US.UTF-8

# Hide username
prompt_context() {}

# Functions

function awsp () {

    arg="$1"
    PROFILE="jayway"
    DEFAULT_PROFILE="jayway"
    case $arg in
        --ordna|-o)
        PROFILE="ordna"
        DEFAULT_PROFILE="ordna"
        ;;
        *)
        # Unknown
        ;;
    esac
    export AWS_PROFILE="$PROFILE"
    export AWS_DEFAULT_PROFILE="$DEFAULT_PROFILE"
    echo "AWS_PROFILE set to $PROFILE and AWS_DEFAULT_PROFILE set to $DEFAULT_PROFILE"
}

alias fix="fuck"
alias megaprune="git fetch && git remote update origin --prune && git branch -vv | grep ': gone]' | cut -f 3 -d ' ' | xargs git branch -D"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# For testing startup performance, enable this line and the line at the top of this file
# zprof # bottom of .zshrc

