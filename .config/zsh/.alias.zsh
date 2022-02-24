# manage dotfiles
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# install rmtrash, (either from the macports or by the brew.)
alias trash="trash -F"
alias rm="echo Use 'trash', or the full path i.e. '/bin/rm'"

alias more='less'

# go to git repo root
alias groot='cd $(git root)'

# gron
alias ungron="gron --ungron"

# kerl
alias kerl_activate='(){ . $KERL_DEFAULT_INSTALL_DIR/$1/activate ;}'
