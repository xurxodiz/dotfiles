export PATH_SAVE=$PATH
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=${HOME}/.config}
export ZDOTDIR=${ZDOTDIR:=${XDG_CONFIG_HOME}/zsh}

if [ -e $ZDOTDIR/.zshenv ]
then
    source $ZDOTDIR/.zshenv
fi

