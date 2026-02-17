" disable a few runtime plugins
let g:loaded_getscriptPlugin=1
let g:loaded_gzip=1
let g:loaded_logiPat=1
let g:loaded_matchparen=1
let g:loaded_netrw=1
let g:loaded_rrhelper=1
let g:loaded_spellfile_plugin=1
let g:loaded_tarPlugin=1
let g:loaded_tutor_mode_plugin=1
let g:loaded_vimballPlugin=1
let g:loaded_zipPlugin=1


" leader
let mapleader=","
let maplocalleader=";"


" general {{{
set nocompatible
set background=dark
colorscheme retrobox
set splitbelow
set splitright

" remove | symbol from separators
set fillchars+=vert:\

set viminfo='1000,	" marks for last 1000 files
set viminfo+=f1,	" save global marks
set viminfo+=<500,	" register contents up to 500 lines
set viminfo+=s100,	" skip registers >100Kb
set viminfo+=h		" disable 'hlsearch' when loading viminfo

set grepprg=rg\ --vimgrep 	" use ripgrep instead of system grep

syntax enable
filetype plugin on
filetype indent on

set undofile

set number relativenumber numberwidth=4

set laststatus=2
set statusline=%f	"path to file
set statusline+=%y	"filetype
set statusline+=,%n	"buffer number
set statusline+=%=	"right side
set statusline+=%l	"current line
set statusline+=/	"literal /
set statusline+=%L	"total lines
set statusline+=,%c	"column number
set statusline+=,%p%%	"percentage through file in lines
set statusline+=,%M	"modified flag ,+ or ,-
" }}}


" ale options {{{
let g:ale_completion_delay=100
let g:ale_completion_enabled=1
let g:ale_disable_lsp=0
let g:ale_fix_on_save=1
let g:ale_fixers={
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'python': ['ruff', 'ruff_format'],
\ 'rust': ['rustfmt'],
\}
let g:ale_lint_delay=200
let g:ale_lint_on_enter=0
let g:ale_lint_on_insert_leave=0
let g:ale_lint_on_text_changed=0
let g:ale_lint_on_save=1
let g:ale_linters_explicit=1
let g:ale_linters={
\ 'python': ['ruff'],
\ 'rust': ['analyzer'],
\ 'zsh': ['shellcheck'],
\}
let g:ale_open_list=0
let g:ale_keep_list_window_open=0
let g:ale_python_auto_uv=1
" }}}


" nerdtree {{{
let NERDTreeShowBookmarks=1

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

" haskell {{{
augroup haskell
	autocmd!
	autocmd FileType haskell :setlocal expandtab
        autocmd FileType haskell :setlocal autoindent
	autocmd FileType haskell :setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END
" }}}

" rust {{{
augroup rust
	autocmd!
	autocmd FileType rust nnoremap <buffer> <localleader>c I//<space><esc>
	autocmd FileType rust :setlocal shiftwidth=4 tabstop=4 softtabstop=4
	autocmd FileType rust :setlocal statusline=%f,%n%=%l/%L,%c,%p%%
	autocmd FileType rust :setlocal foldmethod=indent
	autocmd FileType rust :iabbrev <buffer> iff if{}<left><left>
augroup END
" }}}

" html {{{
augroup html
	autocmd!
	autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
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

" quickfix {{{
augroup quickfix
	autocmd!
	autocmd FileType qf nnoremap <leader>cn :cnext<cr>
	autocmd FileType qf nnoremap <leader>cp :cprevious<cr>
augroup END
" }}}

" ale {{{
augroup ale
  autocmd!
  autocmd FileType nerdtree let b:ale_enabled = 0
" Automatically close the location list if the buffer is closed.
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END
" }}}

" }}}


" keybinds {{{
nnoremap <Space> <Nop>


" close preview window
nnoremap <silent> <leader>pc :pc<CR>


" next/previous
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprev<CR>
" next tab: gt
" previous tab: gT


" ale
nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> <leader>gd :ALEGoToDefinition<CR>
nnoremap <silent> <leader>gr :ALEFindReferences<CR>
nnoremap <silent> <leader>af :ALEFix<CR>
nnoremap <silent> <leader>ai :ALEInfo<CR>
nnoremap <silent> [e <Plug>(ale_previous_wrap)
nnoremap <silent> ]e <Plug>(ale_next_wrap)


" nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap \ :NERDTreeToggle<CR>
nnoremap <leader><C-f> :NERDTreeFind<CR>

" grep for word under cursor
" expand <cWORD> before shellescape to surround with quotes
nnoremap <leader>g :silent execute "grep! " ..  shellescape(expand("<cWORD>")) .. " ."<cr><C-l><cr>:copen 5<cr><C-w>k

" auto enter very magic mode
nnoremap / /\v

" whitespace at end of line bad
" nnoremap <leader>w :match Error /\v^.*\s+$/<cr>
" nnoremap <leader>W :match none<cr>

" turn off search highlight
nnoremap <leader>h :set hlsearch incsearch<cr>
nnoremap <leader>hn :set hlsearch<cr>:nohlsearch<cr>

" append semicolon to line
nnoremap <leader>a :execute "normal! mqA;\e`q"<cr>

" vsplit previous buffer to the left
nnoremap <leader>pb :execute "leftabove vsplit " .. bufname("#")<cr>

" delete 2 lines but undo individual line deletion
nnoremap <leader>d dd:let &g:undolevels = &g:undolevels<cr>dd

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

" copy line and paste below
nnoremap + y$o<esc>p0

" edit and source .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" surround word with quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

nnoremap H 0
nnoremap L $

" surround visual selection with quotes
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>

" exit insert mode
inoremap jk <Esc>
inoremap <Esc> <Nop>

" move in insert mode
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

" move current line down/up
nnoremap - ddp
nnoremap _ ddkP

" uppercase word
nnoremap <leader><C-u> viwU
inoremap <leader><C-u> <Esc>viwUea
" }}}


" substitutions {{{
:iabbrev @@ busygroth@proton.me
" }}}
