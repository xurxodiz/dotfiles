# common config for all shells
source .shell-common

# below, specific config for zsh

source .oh-my-zshrc

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# for completions
fpath=(~/.zsh/completion $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit && compinit -i

# sane history keeping
setopt hist_ignore_all_dups
bindkey "$terminfo[kcuu1]" up-line-or-local-history
bindkey "$terminfo[kcud1]" down-line-or-local-history
up-line-or-local-history() {
    zle set-local-history 1
    zle up-line-or-history
    zle set-local-history 0
}
zle -N up-line-or-local-history
down-line-or-local-history() {
    zle set-local-history 1
    zle down-line-or-history
    zle set-local-history 0
}
zle -N down-line-or-local-history
