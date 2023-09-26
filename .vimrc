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
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'Scuilion/markdown-drawer'
call plug#end()

" For plugins to load correctly
filetype plugin indent on

" Gitgutter keymaps
nmap <leader>hn <Plug>(GitGutterNextHunk)
nmap <leader>hN <Plug>(GitGutterPrevHunk)

" Vim-Latex-Suite
let g:Tex_CompileRule_dvi = 'latex --src-specials -interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'

" Markdown Drawer
let g:markdrawer_prefix = " " 
let g:markdrawer_goto = "o"
let g:markdrawerDelete = "D"
let g:markdrawer_width = "45"
let g:markdrawer_paste_below = "p"
let g:markdrawer_increase = "+"
let g:markdrawer_decrease = "-"
let g:markdrawer_to_delete_color = "Red"

let g:markdrawer_drawer_max_levels = 4 " max levels to display
"let g:markdrawer_toc = 'index' " displays as a TOC
"let g:markdrawer_toc = 'full_index' " displays as a TOC, no index reset

nnoremap <Leader>md :MarkDrawer<cr>

" Matlab
source $VIMRUNTIME/macros/matchit.vim
autocmd BufEnter *.m    compiler mlint
" if mlint doesnt't work try:
" sudo ln -s <MATLABPATH>/bin/glnx86/mlint mlint
" matlab is probably installed in /usr/local

" Make gitguter recognize my config repos
"let g:gitgutter_git_args='--git-dir=$HOME/.cfg --work-tree=$HOME'
"let g:gitgutter_git_args='--git-dir=$HOME/.cfg-vim --work-tree=$HOME'

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
" Misc
"==============================================================================

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
set scrolloff=5
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

" Don't automatically insert comment leader on new lines
autocmd BufNewFile,BufRead * setlocal formatoptions-=o

"==============================================================================
" Custom Commands
"==============================================================================

" Create a C-style header-guard based the name of the current filename
command CreateHeaderGuard :let @+ = toupper(expand("%:t:r")) | :norm ggO#ifndef <ESC>pa_H_<RETURN>#define <ESC>pa_H_<ESC>GGo#endif  // <ESC>pa_H_<ESC>o<ESC><C-O><C-O><C-O>

command CreateClassBoilerplate :norm "nyiwccclass <ESC>"npa {<ESC>opublic:<ESC><<j"np>>A();<ESC>o<ESC>oprivate:<ESC><<o};<RETURN><ESC>

"==============================================================================
" Visual
"==============================================================================

set ruler " Show file stats
set number " Show line numbers

" Set the SignColumn highlight group
highlight! link SignColumn LineNr

" Fix no colors in st
try
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
catch
endtry

function! AreFilesSame(file1, file2)
  let contents1 = readfile(a:file1)
  let contents2 = readfile(a:file2)

  return join(contents1) == join(contents2)
endfunction

" Syntax highlighting
syntax on
let conffile = $HOME . '/.config/Xresources'
let lmfile = $HOME . '/.config/Xresources_light'
let dmfile = $HOME . '/.config/Xresources_dark'

if AreFilesSame(conffile, lmfile)
    set background=light
elseif AreFilesSame(conffile, dmfile)
    set background=dark
else
    " Backup mode is dark
    set background=dark
endif

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
try
    set listchars=tab:\ ▸\ ,trail:·,eol:¬,nbsp:⎵
    set list " To enable by default
catch
    " If the machine does not support the special characters, do nothing
endtry
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle invisible characters

" Highligt code that goes over the 80 column limit
match OverLength /\%>79v.\+/
autocmd WinEnter * match OverLength /\%>79v.\+/

