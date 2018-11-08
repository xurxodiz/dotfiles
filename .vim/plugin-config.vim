" for vim-annotations
let g:vim_annotations_offset = '/.liquid/'
let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_haskell_checkers = ['hdevtools', 'hlint', 'liquid']
let g:syntastic_haskell_liquid_args = "--diff"

" recommended beginner settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" for vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
			\ 'path_html': '~/vimwiki/',
			\ 'syntax': 'markdown',
			\ 'ext': '.md'}]
