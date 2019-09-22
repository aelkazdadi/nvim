#!/bin/sh
VENV_DIR=$HOME/.local/share/nvim

[ -d "$VENV_DIR/venv" ] || python3 -m venv --prompt='neovim' "$VENV_DIR/venv"
$VENV_DIR/venv/bin/pip install wheel
$VENV_DIR/venv/bin/pip install \
  scikit-build\
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
  wrapt\
  rope\
  jedi
