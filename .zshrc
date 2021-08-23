# common config for all shells
source $HOME/.shell-common

# from here on below specific config for zsh

# load OMZ specific config
source $HOME/.oh-my-zshrc

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# for completions
fpath=(~/.zsh/completion $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit && compinit -i

# useful regex mass renaming
autoload -U zmv

# sensible history options
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
unsetopt SHARE_HISTORY

# http://chneukirchen.org/blog/archive/2012/02/10-new-zsh-tricks-you-may-not-know.html
# This will make C-z on the command line resume vi again, so you can toggle between them easily. Even if you typed something already!
foreground-vi() {
    fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

#
# store commands in history file only if they return success
#

# called before a history line is saved.  See zshmisc(1).
function zshaddhistory() {
  # Prevent the command from being written to history before it's
  # executed; save it to LASTHIST instead.  Write it to history
  # in precmd.
  LASTHIST=$1
  # Return value 2: "... the history line will be saved on the internal
  # history list, but not written to the history file".
  return 2
}

# zsh hook called before the prompt is printed.  See zshmisc(1).
function precmd() {
  # Write the last command if successful, using the history buffered by
  # zshaddhistory().
  if [[ $? == 0 && -n $LASTHIST && -n $HISTFILE ]] ; then
    print -sr -- ${=${LASTHIST%%'\n'}}
  fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
