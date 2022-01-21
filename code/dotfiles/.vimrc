
"
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load plugins here (pathogen or vundle)
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Code completion
Plugin 'ycm-core/YouCompleteMe'
" Lightline
Plugin 'itchyny/lightline.vim'
" Syntax highlighting
Plugin 'sheerun/vim-polyglot'
" Nerd tree file explorer
Plugin 'preservim/nerdtree'
" Icons for Nerd Tree
Plugin 'ryanoasis/vim-devicons'
" Syntax highlighting for Nerd Tree
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" Nerd commenter, enhance commenting
Plugin 'preservim/nerdcommenter'
" Git gutter
Plugin 'airblade/vim-gitgutter'
" Auto pairs
Plugin 'jiangmiao/auto-pairs'
" Yank highlight
Plugin 'machakann/vim-highlightedyank'
" Colorschemes
Plugin 'morhetz/gruvbox'
Plugin 'rakr/vim-one'
Plugin 'tomasr/molokai'
Plugin 'lifepillar/vim-solarized8'
Plugin 'dracula/vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'sainnhe/gruvbox-material'
Plugin 'nanotech/jellybeans.vim'
" Fuzzy finder
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
" Code formatter
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
call vundle#end()

" YCM Configs
let g:ycm_clangd_binary_path = "/usr/bin/clangd"

" codefmt configs
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END


" For plugins to load correctly
filetype plugin indent on

" Remapping the leader key
let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Disabling screen flash
set t_vb=

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Enables mouse
set mouse=a

set clipboard=unnamed

" Enables split below and right
set splitbelow
set splitright
" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" clear search
map <leader><space> :let @/=''<cr>

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Enables folding
set foldmethod=indent
set foldlevel=99
nnoremap <Leader>z za

" Enables fuzzy finder
nnoremap <silent> <Leader>f :Rg<Cr>

" See the docstrings for folded code
let g:SimpylFold_docstring_preview=1

" Colorschemes
syntax on
colorscheme jellybeans
let g:gruvbox_contrast_dark = 'hard'
set t_Co=256
set termguicolors
set background=dark
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Menu 
set wildmenu

" NERDTree shortcut
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTree<CR>
" NERDTree show hidden files
let NERDTreeShowHidden=1
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
let g:NERDTreeWinSize=40

" Yank highlight duration in milisecond
let g:highlightedyank_highlight_duration=200

" Python specific configs
let g:python_highlight_space_errors = 0

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>}]

