#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# my personal configs
PATH=$PATH:~/workspaces/probe/commands
alias ll='ls -lrtaF --color=auto'
alias ls='ls -rtF --color=auto'
alias vi=vim
PATH=$PATH:~/workspaces/opt/node-v22.12.0-linux-x64/bin/
PATH=$PATH:~/workspaces/opt/jdk-17.0.2/bin/
PATH=$PATH:~/workspaces/opt/go/bin/
PATH=$PATH:~/workspaces/opt/apache-maven-3.9.9/bin
