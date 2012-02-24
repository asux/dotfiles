source /etc/profile
#source /etc/zsh/zprofile

setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt AUTO_CD
setopt CORRECT_ALL
setopt PROMPT_SUBST

autoload -U zkbd
autoload -U compinit
compinit

autoload -U promptinit && promptinit
#prompt gentoo

fpath=(~/.zsh/functions $fpath)

autoload -U ~/.zsh/functions/*(:t)

#PREPROMPT='%B%F{yellow}%*%f%b '
PREPROMPT=''
local git_prompt='%B%F{yellow}$(git_info_for_prompt)%f%b'
local rvm_prompt='%B%F{red}$(rvm_ruby_prompt)%f%b'
AFTERPROMPT="${git_prompt}${rvm_prompt}"
if [[ ${USERNAME} = 'root' ]]; then
    PROMPT="${PREPROMPT}%B%F{red}%m%k %B%F{blue}%1~${AFTERPROMPT}%B%F{blue} %# %b%f%k"
else
    PROMPT="${PREPROMPT}%B%F{green}%n@%m%k %B%F{blue}%1~${AFTERPROMPT}%B%F{blue} %# %b%f%k"
fi
export PROMPT
#export RPROMPT="%F{yellow}(%?)[%h]%f"

#limit stack 8192
#limit core 0

zstyle ':completion:*' menu yes select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:processes' command 'ps xua'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b)#([0-9]#)*=0=01;31'
[ -f ~/.zsh/git-flow-completion/git-flow-completion.zsh ] && source ~/.zsh/git-flow-completion/git-flow-completion.zsh
#
export HISTFILE="${HOME}/.zhistory"
export SAVEHIST=5000
export HISTSIZE=5000
export DIRSTACKSIZE=20

[[ $OSTYPE == linux* ]] && eval `dircolors`

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

if [ -f /usr/bin/grc ]; then
    alias ping="grc --colour=auto ping"
    alias traceroute="grc --colour=auto traceroute"
    alias make="grc --colour=auto make"
    alias diff="grc --colour=auto diff"
    alias cvs="grc --colour=auto cvs"
    alias netstat="grc --colour=auto netstat"
fi

bindkey -v
case ${TERM} in
    xterm*|rxvt)
        precmd () { print -Pn "\e]0;%n@%m: %~\a" }
        preexec () { print -Pn "\e]0;%n@%m: $1\a" }
    ;;
    screen)
        precmd () { print -Pn "\033k%~\033\\" }
        preexec () { print -Pn "\033k$1\033\\" }
    ;;
esac
case ${TERM} in
    linux|screen|screen.linux)
        bindkey "^[[2~" yank
        bindkey "^[[3~" delete-char
        bindkey "^[[5~" up-line-or-history
        bindkey "^[[6~" down-line-or-history
        bindkey "^[[1~" beginning-of-line
        bindkey "^[[4~" end-of-line
        bindkey "^[e" expand-cmd-path      # C-e for expanding path of typed command
        bindkey "^[[A" up-line-or-search   # up arrow for back-history-search
        bindkey "^[[B" down-line-or-search # down arrow for fwd-history-search
        bindkey " "  magic-space           # do history expansion on space
        ;;
    *xterm*|rxvt|(dt|k|E)term)
        bindkey "^[[2~" yank
        bindkey "^[[3~" delete-char
        bindkey "^[[5~" up-line-or-history
        bindkey "^[[6~" down-line-or-history
        bindkey "^[[H" beginning-of-line
        bindkey "^[[F" end-of-line
        bindkey "^E" expand-cmd-path
        bindkey "^[[A" up-line-or-search
        bindkey "^[[B" down-line-or-search
        bindkey " "  magic-space
    ;;
esac
alias zreload='source ~/.zshrc'
alias viz='vim ~/.zshrc'
alias ls='ls -aFG'
alias df='df -h'
alias du='du -h'
alias mxterm='xterm -fn "-*-terminus-*-r-normal-*-12-120-*-*-*-*-*-cp1251"'
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -iR'
alias rm='nocorrect rm -i'
alias rmf='nocorrect rm -f'
alias rmrf='nocorrect rm -fR'
alias mkdir='nocorrect mkdir'
alias h=history
#alias grep=egrep
alias df='df -m'
alias less='less -RMS'
alias ispell='ispell -d russian'
[[ $OSTYPE == linux* ]] && alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias li='ls -ial'
alias lsd='ls -ld *(-/DN)'
alias lsa='ls -ld .*'
alias -g M='|more'
alias -g L='|less'
alias -g H='|head'
alias -g T='|tail'
alias -g N='2>/dev/null'

alias vi='vim'

#MANPAGER='/usr/bin/most -s'
MANPAGER="less -RMS"
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export SCIPY_PIL_IMAGE_VIEWER=okular
export EDITOR="vim"

[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"  # This loads RVM into a shell session.

[[ -d ${HOME}/scripts ]] && PATH="${HOME}/scripts:${PATH}"
[[ -d ${HOME}/bin ]] && PATH="${HOME}/bin:${PATH}"
[[ -f ${HOME}/.aliases ]] && source ${HOME}/.aliases
[[ -e ${HOME}/.zshrc.${OSTYPE} ]] && source ${HOME}/.zshrc.${OSTYPE}
[[ -e ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local

export PATH

unset RUBYOPT
