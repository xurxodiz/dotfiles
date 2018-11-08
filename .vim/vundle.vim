" vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'jreybert/vimagit'
Plugin 'w0rp/ale'
Plugin 'scrooloose/syntastic'
Plugin 'panagosg7/vim-annotations'
Plugin 'vimwiki/vimwiki'

call vundle#end()            " required
