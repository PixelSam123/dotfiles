#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='eza --color=auto'
alias ll='ls -la'
alias grep='grep --color=auto'
alias vi='nvim'
alias ssh='env TERM=xterm-256color ssh'

eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"
