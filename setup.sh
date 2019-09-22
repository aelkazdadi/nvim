#!/bin/sh
VENV_DIR=$HOME/.local/share/nvim/venv

[ -d $VENV_DIR ] || python3 -m venv --prompt='neovim' $VENV_DIR
. $VENV_DIR/bin/activate
$VENV_DIR/bin/pip3 install\
    appdirs\
    astroid\
    attrs\
    autopep8\
    black\
    Click\
    entrypoints\
    flake8\
    greenlet\
    isort\
    lazy-object-proxy\
    mccabe\
    msgpack\
    neovim\
    pycodestyle\
    pyflakes\
    pylint\
    pynvim\
    six\
    toml\
    typed-ast\
    Unidecode\
    wrapt
