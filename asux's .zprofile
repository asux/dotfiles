#!/bin/zsh
# ~/.zprofile
source ${HOME}/.aliases

[[ -d ${HOME}/bin ]] && PATH=${HOME}/bin:${PATH}
[[ -d ${HOME}/dev/python ]] && PYTHONPATH="${HOME}/dev/python:${PYTHONPATH}"
[[ -d ${HOME}/dev/pylons ]] && PYTHONPATH="${HOME}/dev/pylons:${PYTHONPATH}"
[[ -d ${HOME}/dev/django ]] && PYTHONPATH="${HOME}/dev/django:${PYTHONPATH}"

export PATH PYTHONPATH

#MANPAGER='/usr/bin/most -s'
MANPAGER="/usr/bin/less -RMS"
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export SCIPY_PIL_IMAGE_VIEWER=okular
export EDITOR="/usr/bin/vim"
