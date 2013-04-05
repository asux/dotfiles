# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"

# Example aliases
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-hubflow rails ruby rvm sublime osx brew)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

fpath=(~/.zsh/functions $fpath)
autoload rvm_ruby_prompt

export RPROMPT='%{$fg[red]%}$(rvm_ruby_prompt)%{$reset_color%}'

[[ -x ${HOME}/.rvm/scripts/rvm ]] && source ${HOME}/.rvm/scripts/rvm
[[ -d ${HOME}/scripts ]] && PATH="${HOME}/scripts:${PATH}"
[[ -d ${HOME}/bin ]] && PATH="${HOME}/bin:${PATH}"
[[ -f ${HOME}/.aliases ]] && source ${HOME}/.aliases
[[ -e ${HOME}/.zshrc.${OSTYPE} ]] && source ${HOME}/.zshrc.${OSTYPE}
[[ -e ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local

unset RUBYOPT

### Added by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH
