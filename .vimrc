let mapleader = ","
let maplocalleader = ";"

" general options {{{
set background=dark
:syntax enable

filetype plugin indent on
set nocompatible
set smartindent
set number relativenumber numberwidth=4
set laststatus=2

set statusline=%f	"path to file
set statusline+=%y	"filetype
set statusline+=%n	"buffer number
set statusline+=%=	"right side
set statusline+=%l	"current line
set statusline+=/	"literal /
set statusline+=%L	"total lines
set statusline+=,%c	"column number
set statusline+=,%p%%	"percentage through file in lines
set statusline+=,%M	"modified flag ,+ or ,-
" }}}


" autocommands {{{

" vimscript {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim :setlocal foldmethod=marker
	autocmd FileType vim :setlocal foldlevelstart=0
augroup END
" }}}

" python {{{
augroup python
	autocmd!
	autocmd FileType python nnoremap <buffer> <localleader>c I#<space><esc>
	autocmd FileType python :setlocal shiftwidth=4 tabstop=4 softtabstop=4
	autocmd FileType python :setlocal statusline=%f,%n%=%l/%L,%c,%p%%
	autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END
" }}}

" rust {{{
augroup rust
	autocmd!
	autocmd FileType rust nnoremap <buffer> <localleader>c I//<space><esc>
	autocmd FileType rust :setlocal shiftwidth=2 tabstop=2 softtabstop=2
	autocmd FileType rust :setlocal statusline=%f,%n%=%l/%L,%c,%p%%
	autocmd FileType rust :iabbrev <buffer> iff if{}<left><left>
augroup END
" }}}

" html {{{
augroup html
	autocmd!
	autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
" }}}

" file {{{
augroup file
	autocmd!
	autocmd BufNewFile * :write
	autocmd BufWritePre,BufRead *.html :normal gg=G
	autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END
" }}}

" markdown {{{
augroup markdown
	autocmd!
	autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^\\([-=]\\+\\)$\r:nohlsearch\rkvg_"<cr>
	autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?^\\([-=]\\+\\)$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}

" }}}


" keybinds {{{
nnoremap <Space> <Nop>

" modify text inside parentheses
onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap an( :<c-u>normal! f(hviw<cr>
onoremap al( :<c-u>normal! F(hviw<cr>

onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap il[ :<c-u>normal! F]vi[<cr>
onoremap an[ :<c-u>normal! f[hviw<cr>
onoremap al[ :<c-u>normal! F[hviw<cr>

onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap an{ :<c-u>normal! f{hviw<cr>
onoremap al{ :<c-u>normal! F{hviw<cr>

onoremap in< :<c-u>normal! f<vi<<cr>
onoremap il< :<c-u>normal! F>vi<<cr>
onoremap an< :<c-u>normal! f<hviw<cr>
onoremap al< :<c-u>normal! F<hviw<cr>


nnoremap + y$o<esc>p0

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap H 0
nnoremap L $

vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>

inoremap jk <Esc>
inoremap <Esc> <Nop>

inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

nnoremap - ddp
nnoremap _ ddkP

nnoremap <leader><C-u> viwU
inoremap <leader><C-u> <Esc>viwUA
" }}}


" substitutions {{{
:iabbrev @@ busygroth@proton.me
" }}}
