" vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$XDG_CONFIG_HOME/vim/bundle/Vundle.vim
call vundle#begin("$XDG_CONFIG_HOME/vim/bundle")

Plugin 'editorconfig/editorconfig-vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'VundleVim/Vundle.vim'

call vundle#end()            " required
