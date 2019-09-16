#!/usr/bin/zsh
source $HOME/.zshrc

function cd() {
    builtin cd "$@"
    python3 $VIMCONFIG/plugin/rc.py lcd
}

function gd() {
    builtin cd "$@"
    python3 $VIMCONFIG/plugin/rc.py tcd
}

function e() {
    python3 $VIMCONFIG/plugin/rc.py edit "$@"
}
