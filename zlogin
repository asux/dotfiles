#!/bin/zsh

alias zshconfig="${EDITOR} ~/.zshrc"
alias ohmyzsh="${EDITOR} ~/.oh-my-zsh"

[[ -f ${HOME}/.aliases.sh ]] && source ${HOME}/.aliases.sh
[[ -f ${HOME}/.zshrc.${OSTYPE} ]] && source ${HOME}/.zshrc.${OSTYPE}
[[ -f ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local

[[ -d ${HOME}/scripts ]] && export PATH="${HOME}/scripts:${PATH}"
[[ -d ${HOME}/bin ]] && export PATH="${HOME}/bin:${PATH}"

if [ -d "{$HOME}/platform-tools" ]; then
    export PATH="${HOME}/platform-tools:$PATH"
fi

if [ -d ${HOME}/.zsh/environment ]; then
    for file in ${HOME}/.zsh/environment/*.env; do
        source $file
    done
fi
