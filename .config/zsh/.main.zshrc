# fzf
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

# useful regex mass renaming
autoload -U zmv

# sensible history options
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
unsetopt SHARE_HISTORY

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

#
# store commands in history file only if they return success
#

# zsh hook called before the prompt is printed.  See zshmisc(1).
function precmd() {
  # Write the last command if successful, using the history buffered by
  # zshaddhistory().
  if [[ $? == 0 && -n $LASTHIST && -n $HISTFILE ]] ; then
    print -sr -- ${=${LASTHIST%%'\n'}}
  fi
}

# http://chneukirchen.org/blog/archive/2012/02/10-new-zsh-tricks-you-may-not-know.html
# This will make C-z on the command line resume vi again, so you can toggle between them easily. Even if you typed something already!
foreground-vi() {
    fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

# fix moving by words with alt
# (unneeded as long as iTerm2 has Natural Text Editing)
# bindkey "\e\e[D" backward-word
# bindkey "\e\e[C" forward-word
# bindkey "^[^?"" backward-kill-word

# fzf-tab, usual configuration
enable-fzf-tab
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# asdf java home
source "$ASDF_DATA_DIR/plugins/java/set-java-home.zsh"
