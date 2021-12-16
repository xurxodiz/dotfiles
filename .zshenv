# No need to export anything here, as .zshenv is sourced for _every_ shell.
# (unless invoked with zsh -f)

# This could also be assigned on export in .zprofile.
# However, now we can reuse its value in $ZDOTDIR.
: ${XDG_CONFIG_HOME:=$HOME/.config}

# Needs to be set here, so Zsh can find your other dotfiles. 
ZDOTDIR=$XDG_CONFIG_HOME/zsh
