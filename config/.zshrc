#!/usr/bin/zsh
source $HOME/.zshrc

unalias cd >/dev/null 2>&1
unalias gd >/dev/null 2>&1
unalias e >/dev/null 2>&1

[[ -z LOCAL_HOME ]] || LOCAL_HOME=$HOME

function cd() {
  HOME=$LOCAL_HOME builtin cd "$@"
  python3 $VIMCONFIG/config/shell.py lcd
}

function gd() {
  HOME=$LOCAL_HOME builtin cd "$@"
  python3 $VIMCONFIG/config/shell.py tcd
}

function e() {
  python3 $VIMCONFIG/config/shell.py edit "$@"
  exit
}
