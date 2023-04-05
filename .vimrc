let mapleader = " "

" don't lose selection when indenting
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

map <C-c> <Esc>

noremap <leader>E $
noremap <leader>I ^

nnoremap <leader>su <c-w>v
nnoremap <leader>sh <c-w>s
nnoremap <leader>l <c-w>l
nnoremap <leader>h <c-w>h
nnoremap <leader>k <c-w>k
nnoremap <leader>j <c-w>j

" move between tabs
nnoremap <leader>wh gT
nnoremap <leader>wl gt

" copy until end
nnoremap Y yg$

" first paste
nnoremap <leader>pf "0p
