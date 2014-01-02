PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:${PATH}"

for file in ${HOME}/.zshenv.*; do
    source $file
done

[[ -x ${HOME}/.rvm/scripts/rvm ]] && source ${HOME}/.rvm/scripts/rvm
[[ -f ${HOME}/.aliases ]] && source ${HOME}/.aliases
[[ -e ${HOME}/.zshrc.${OSTYPE} ]] && source ${HOME}/.zshrc.${OSTYPE}
[[ -e ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local


### Added by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"

[[ -d ${HOME}/scripts ]] && PATH="${HOME}/scripts:${PATH}"
[[ -d ${HOME}/bin ]] && PATH="${HOME}/bin:${PATH}"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH
export EDITOR="subl -n"
