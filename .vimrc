call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/seoul256.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
" Initialize plugin system
call plug#end()

"Set the colorscheme
colo seoul256

"Call :set background=dark|light to switch
" Use F9 to toggle paste modes (non indent)
set pastetoggle=<F9>

"Fast write options
nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <c-o><F2>

" Preserve selection after indentation. Visual block is still on.
vmap > >gv
vmap < <gv

" Map tab to indent in visual mode. Use tab and shift-tab to move instead of >
vmap <Tab> >gv
vmap <S-Tab> <gv
