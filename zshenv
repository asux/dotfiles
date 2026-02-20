#!/bin/zsh

[[ -d ${HOME}/bin ]] && export PATH="${HOME}/bin:${PATH}"
[[ -d ${HOME}/.local/bin ]] && export PATH="${HOME}/.local/bin:${PATH}"

export VISUAL="cursor"

if [[ -n ${SSH_CONNECTION} ]]; then
  export EDITOR="vim"
else
  export EDITOR=${VISUAL}
fi

export DOTFILES="${HOME}/dotfiles"
