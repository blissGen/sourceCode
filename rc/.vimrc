set cc=80
set tw=79
set tabstop=2
set shiftwidth=2
set rnu

set laststatus=2
set statusline=
set statusline+=%F
set statusline+=%=
set statusline+=(%l,%c)\
set statusline+=(%P,%L)

syntax on 

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/preservim/nerdtree.git' 
Plug 'https://github.com/vim-syntastic/syntastic.git' 
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/gisraptor/vim-lilypond-integrator.git'

call plug#end() 

map <C-n> :NERDTreeToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
