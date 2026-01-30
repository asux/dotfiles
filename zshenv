#!/bin/zsh

export VISUAL="cursor"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR=$VISUAL
fi
