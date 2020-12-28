" Vundle
source $HOME/.vim/vundle.vim

" Plugin configuration
source $HOME/.vim/plugin-config.vim

" fzf
set rtp+=/usr/local/opt/fzf


" Below, general vim config


filetype plugin indent on
syntax on

set background=dark
colorscheme desert

hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235

set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y(%{virtualenv#statusline()})%=%c,%l/%L\ %P

set hlsearch    " highlight all search results
set ignorecase  " do case insensitive search
set incsearch   " show incremental search results as you type
set number      " display line number
set noswapfile  " disable swap file
