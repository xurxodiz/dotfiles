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

# sensible history options
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS

# http://chneukirchen.org/blog/archive/2012/02/10-new-zsh-tricks-you-may-not-know.html
# This will make C-z on the command line resume vi again, so you can toggle between them easily. Even if you typed something already!
foreground-vi() {
    fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

# suggest commands as you type
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlight on command line (must be last of file!)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

