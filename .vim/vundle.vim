" vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'w0rp/ale'
Plugin 'panagosg7/vim-annotations'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'plytophogy/vim-virtualenv'

call vundle#end()            " required
