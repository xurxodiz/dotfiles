# load OMZ specific config
source $XDG_CONFIG_HOME/omz/.zshrc

source $XDG_CONFIG_HOME/zsh/.exports.zsh
source $XDG_CONFIG_HOME/zsh/.alias.zsh
source $XDG_CONFIG_HOME/zsh/.main.zshrc


if [ -e $XDG_CONFIG_HOME/zsh/.local.zshrc ]
then
    source $XDG_CONFIG_HOME/zsh/.local.zshrc
fi
