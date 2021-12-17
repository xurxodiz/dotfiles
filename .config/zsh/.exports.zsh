# have brew install supersede defaults (e.g. bash)
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

# some utility scripts are useful to have in ~/bin
# some scripts (stack) install things in ~/.local/bin
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# -R makes it support ANSI colors
# -F makes it exit automatically if one screen only
export PAGER='less -RF'

# virtualenvwrapper config
export WORKON_HOME=$XDG_DATA_HOME/virtualenvs
export VIRTUALENVWRAPPER_PYTHON=`which python3`
source /usr/local/bin/virtualenvwrapper.sh

# show virtualenv in prompt
export VIRTUAL_ENV_DISABLE_PROMPT=

# for ls to display colors
unset LSCOLORS

# FZF
export FZF_DEFAULT_OPTS="-m -1 -0 --history=$XDG_STATE_HOME/fzf/history --reverse --min-height 15 --bind '?:toggle-preview' --color=dark"
export FZF_COMPLETION_OPTS="--preview=\"file -b {}\" --preview-window=down:1"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:wrap:hidden"
export FZF_ALT_C_OPTS="--preview 'ls -A {}' --preview-window right:25%:hidden"
if hash rg 2>/dev/null; then
    export FZF_DEFAULT_COMMAND='rg --hidden --follow -uuu --files --no-messages'
fi
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# mcfly
export MCFLY_FUZZY=true

# only effective if NVM exists
export NVM_DIR="$XDG_CONFIG_HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export HISTSIZE=10000
export SAVEHIST=10000
# HISTFILE is used by interactive shells only.
# Plus, sub shells & external commands don't need this var.
# Hence, we put it in .zshrc and don't export it.
HISTFILE=$XDG_STATE_HOME/zsh/history

# For moving .vim into .config/vim
export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"

export ZSHZ_DATA="$XDG_STATE_HOME/.z"

export LESSHISTFILE="$XDG_STATE_HOME"/less/history

# moves python history into XDG_STATE_HOME
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/pythonrc