#!/bin/zsh
source /etc/profile

autoload -U promptinit && promptinit
prompt gentoo

setopt PROMPT_SUBST

fg_green=$'%{\e[0;32m%}'
fg_blue=$'%{\e[0;34m%}'
fg_cyan=$'%{\e[0;36m%}'
fg_red=$'%{\e[0;31m%}'
fg_brown=$'%{\e[0;33m%}'
fg_purple=$'%{\e[0;35m%}'
fg_light_gray=$'%{\e[0;37m%}'
fg_dark_gray=$'%{\e[1;30m%}'
fg_light_blue=$'%{\e[1;34m%}'
fg_light_green=$'%{\e[1;32m%}'
fg_light_cyan=$'%{\e[1;36m%}'
fg_light_red=$'%{\e[1;31m%}'
fg_light_purple=$'%{\e[1;35m%}'
fg_white=$'%{\e[1;37m%}'
fg_black=$'%{\e[0;30m%}' 
fg_no_colour=$'%{\e[0m%}'
#PS1="${fg_green}%*${fg_red}${fg_red}${fg_dark_gray}%n${fg_cyan}@${fg_brown}%m${fg_white}:${fg_black}%~${fg_red}>${fg_black} "
#PS1="${fg_dark_gray}%*${fg_red}${fg_red}${fg_black}%n${fg_red}@${fg_blue}%m${fg_black}:${fg_black}%~${fg_red}>${fg_black} "
if [[ ${USERNAME} = 'root' ]]; then
    PROMPT='%B%F{yellow}[%*]%f%b%B%F{red}%m%k %B%F{blue}%1~ %# %b%f%k'
else
    PROMPT='%B%F{yellow}[%*]%f%b%B%F{green}%n@%m%k %B%F{blue}%1~ %# %b%f%k'
fi
export PROMPT
export RPROMPT="%F{yellow}(%?)[%h]%f"

limit stack 8192 
limit core 0 
autoload -U zkbd
autoload -U compinit 
compinit 

zstyle ':completion:*' menu yes select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:processes' command 'ps xua'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b)#([0-9]#)*=0=01;31' 
#
export HISTFILE="${HOME}/.zhistory"
export SAVEHIST=5000
export HISTSIZE=5000
export DIRSTACKSIZE=20 

setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS 
eval `dircolors` 

alias ls='ls --color=auto'

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
alias zsh_reload='source ~/.zshrc'
alias ls='ls -aFG'
alias df='df -h'
alias du='du -h'
alias viz='vim ~/.zshrc'
alias mxterm='xterm -fn "-*-terminus-*-r-normal-*-12-120-*-*-*-*-*-cp1251"'
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -iR'
alias rm='nocorrect rm -i'
alias rmf='nocorrect rm -f'
alias rmrf='nocorrect rm -fR'
alias mkdir='nocorrect mkdir'
alias h=history
alias grep=egrep
alias df='df -m'
alias less='less -M'
alias ispell='ispell -d russian'
alias ls='ls -F --color=auto'
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