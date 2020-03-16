let $ZDOTDIR = $HOME . '/.local/share/zsh'
let local_home = readfile($ZDOTDIR . '/zshextra')[0]
execute substitute(local_home, 'export ', 'let $', '')
cd $LOCAL_HOME
