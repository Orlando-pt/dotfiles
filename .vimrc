let mapleader = " "

" don't lose selection when indenting
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

map <C-c> <Esc>

noremap <leader>E $
noremap <leader>I ^

nnoremap <leader>sv <c-w>v
nnoremap <leader>sh <c-w>s
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l

" move between tabs
nnoremap <leader>th gT
nnoremap <leader>tl gt

" copy until end
nnoremap Y yg$

" first paste
nnoremap <leader>pf "0p
