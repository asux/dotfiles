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

source ${HOME}/.zshenv.*
