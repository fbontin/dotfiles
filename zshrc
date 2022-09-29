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

# Theme
ZSH_THEME="agnoster"

# Plugins
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh


# User configuration
LANG=en_US.UTF-8

# Hide username
prompt_context() {}

# Add date to prompt with color (turned off for now since it doesn't work with 'fix')
# autoload -U colors && colors
# RPROMPT="%{$fg[green]%}[%D{%k:%M:%S}]%{$reset_color%}"

# --- ADD-ONS ---
eval $(thefuck --alias)

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# So zsh can find and use yarn as a command
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

alias fix="fuck"
alias megaprune="git fetch && git remote update origin --prune && git branch -vv | grep ': gone]' | cut -f 3 -d ' ' | xargs git branch -D"
alias reload="exec $SHELL -l" # Reload the shell

# Ordna/Kompis
alias kompis="cd ~/Desktop/dev/ordna/CBF-RE-IPEX-KOMPIS"

# For testing startup performance, enable this line and the line at the top of this file
# zprof # bottom of .zshrc

