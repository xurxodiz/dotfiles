# Path to your oh-my-zsh installation.
export ZSH=$XDG_CONFIG_HOME/omz/oh-my-zsh
export ZSH_CUSTOM=$XDG_CONFIG_HOME/omz/custom
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
export ZSH_COMPDUMP="${ZSH_CACHE_DIR}/.zcompdump-${(%):-%m}-${ZSH_VERSION}"
# permission conflict with homebrew, disable check
export ZSH_DISABLE_COMPFIX=true

# ensure the file is created there and not elsewhere
# Create a cache folder if it isn't exists
if [ ! -d "${ZSH_CACHE_DIR}" ]; then
    mkdir -p ${ZSH_CACHE_DIR}
fi

# Theme to load
ZSH_THEME="starfox"

# for completions, these must come before the OMZ file below
fpath=($ZSH_CACHE_DIR/completion $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)

# Which plugins would you like to load? (plugins can be found in ~/.config/omz/plugins/*)
plugins+=(
  colored-man-pages
  colorize
  docker
  docker-compose
  fzf
  git
  pip
  python
  virtualenv
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
  z
)


source $ZSH/oh-my-zsh.sh