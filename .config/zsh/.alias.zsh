# manage dotfiles
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias more='less'

# go to git repo root
alias groot='cd $(git root)'

# gron
alias ungron="gron --ungron"

# kerl
alias kerl_activate='(){ . $KERL_DEFAULT_INSTALL_DIR/$1/activate ;}'

# useful
alias ..='cd ..'
alias ...="cd ../.."

sandbox () {
  cd "$(mktemp -d)"
  chmod -R 0700 .
  if [[ $# -eq 1 ]]; then
    \mkdir -p "$1"
    cd "$1"
    chmod -R 0700 .
  fi
}

boop () {
  local last="$?"
  if [[ "$last" == '0' ]]; then
    say great
  else
    say damnit
  fi
  $(exit "$last")
}

function mkcd { mkdir -p "$1"; cd "$1"; }

alias _="cd $(mktemp -d) ; "

# integrate fzf with z
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}
