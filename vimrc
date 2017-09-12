set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'chankaward/vim-railscasts-theme'

Plugin 'scrooloose/nerdTree'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'PProvost/vim-ps1.git'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
filetype plugin indent on
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
set smartindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set ic
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/venv/*

let g:airline_theme='zenburn'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

colorscheme railscasts
set number

autocmd BufNewFile,BufRead *.json set ft=javascript
set hlsearch
