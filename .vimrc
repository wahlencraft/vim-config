" Don't try to be vi compatible
set nocompatible

" Pick a leader key
let mapleader = ","
let maplocalleader = ","

" Don't autocomplete unless unique.
set wildmode=longest

" Get rid of bad habits
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Security
set modelines=0

set updatetime=100

" Folding
set foldmethod=syntax
set foldlevel=99

" Blink cursor on error instead of beeping (grr)
set visualbell

set wrap  " Let long lines continue out of screen
set textwidth=0 " Dont autowrap
"set formatoptions=tcqrn1
set noshiftround
set whichwrap+=<,>,h,l,[,] " wrap cursor left and right

" Allow visual block selection further than line end
set virtualedit+=block

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Add empty lines without entering inster mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch!
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=""<CR>

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Copy to clipboard
set clipboard=unnamedplus

" Create a C-style header-guard based the name of the current file
command CreateHeaderGuard :let @+ = toupper(expand("%:t:r")) | :norm ggO#ifndef <ESC>pa_H_<RETURN>#define <ESC>pa_H_<ENTER><ESC>GGo#endif  // <ESC>pa_H_<RETURN><ESC><C-O><C-O><C-O>

"=============================================================================
" Environment specific settings
"=============================================================================

function! SetupEnvironment()
    let l:path = expand('%:p')
    if l:path =~# '\/.*\/pico-alarm-clock\/.*\>'
        setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    endif
endfunction

autocmd! BufReadPost,BufNewFile * call SetupEnvironment()

autocmd BufWritePost */Xresources !xrdb ~/.config/Xresources

"==============================================================================
" Plugins
"==============================================================================

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Install vim-plug
" Plugins
call plug#begin()
Plug 'wincent/terminus'
Plug 'airblade/vim-gitgutter'
Plug 'fladson/vim-kitty'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'lervag/vimtex'
call plug#end()

" For plugins to load correctly
filetype plugin indent on

" Gitgutter keymaps
nmap <leader>hn <Plug>(GitGutterNextHunk)
nmap <leader>hN <Plug>(GitGutterPrevHunk)

" vimtex
let g:vimtex_view_method = 'zathura'

if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

" Matlab
source $VIMRUNTIME/macros/matchit.vim
autocmd BufEnter *.m    compiler mlint
" if mlint doesnt't work try:
" sudo ln -s <MATLABPATH>/bin/glnx86/mlint mlint
" matlab is probably installed in /usr/local

" Make gitguter recognize my config repos
"let g:gitgutter_git_args='--git-dir=$HOME/.cfg --work-tree=$HOME'
"let g:gitgutter_git_args='--git-dir=$HOME/.cfg-vim --work-tree=$HOME'
"
"===============================================================================
" Visual
"===============================================================================

set ruler " Show file stats
set number " Show line numbers

" Set the SignColumn highlight group
highlight! link SignColumn LineNr

" Fix no colors in st
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Turn on syntax highlighting
syntax on
set background=dark
colorscheme custom
au BufNewFile,BufRead *.m colorscheme matlab
au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

" Encoding
set encoding=utf-8

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" Visualize invisible characters
set listchars=tab:\ ▸\ ,trail:·,eol:¬,nbsp:⎵
set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle invisible characters

" Highligt code that goes over the 80 column limit
match OverLength /\%>79v.\+/
autocmd WinEnter * match OverLength /\%>79v.\+/
