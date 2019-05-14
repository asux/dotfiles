#!/usr/local/bin/zsh

for file in ${HOME}/.zsh/environment/*.env; do
    source $file
done

[[ -f ${HOME}/.aliases ]] && source ${HOME}/.aliases
[[ -e ${HOME}/.zshrc.${OSTYPE} ]] && source ${HOME}/.zshrc.${OSTYPE}
[[ -e ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local

[[ -d ${HOME}/scripts ]] && export PATH="${HOME}/scripts:${PATH}"
[[ -d ${HOME}/bin ]] && export PATH="${HOME}/bin:${PATH}"

if [ -d "$HOME/platform-tools" ]; then
    export PATH="$HOME/platform-tools:$PATH"
fi