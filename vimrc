filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdTree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'kshenoy/vim-signature'
Plugin 'fweep/vim-tabber'
Plugin 'junegunn/fzf'
Plugin 'open-browser.vim'
Plugin 'tyru/open-browser-github.vim'
Plugin 'tpope/vim-eunuch'
Plugin 'junegunn/goyo.vim'
Plugin 'jdc0589/flatlandia'
" All of your Plugins must be added before the following line
call vundle#end()            " required
"" To ignore plugin indent changes, instead use:
"" Brief help
"" :PluginList       - lists configured plugins
"" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""
"" see :h vundle for more details or wiki for FAQ
"" Put your non-Plugin stuff after this line
syntax on
filetype plugin indent on
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
set smartindent
set tabstop=2
set shiftwidth=2
set ic
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/venv/*

" using the mouse is an antipattern, but its super useful for casually
" browsing source sometimes
"set mouse=a
"if has("mouse_sgr")
"    set ttymouse=sgr
"else
"    set ttymouse=xterm2
"end

let g:airline_theme='zenburn'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" make test commands execute using dispatch.vim
let test#strategy = "vimterminal"

map <C-p> :FZF<CR>
let g:fzf_files_options =
	\ '--preview "(highlight -O ansi {} || cat {})'.
	\ ' > /dev/null | head -'.&lines.'"'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

colorscheme flatlandia
set number
set tabline=%!tabber#TabLine()

set hlsearch
set splitbelow
set splitright
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-h> <C-W><C-H>
nnoremap <C-l> <C-W><C-L>
set backspace=indent,eol,start

" tabs
"nnoremap <C-]> tabnext
"nnoremap <C-[> tabprevious

" bad habbits are bad, and I hate myself....
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" cause I hit shift every time by mistake somehow
cnoreabbrev W w

cnoreabbrev vterminal vertical terminal
cnoreabbrev vt vertical terminal
cnoreabbrev ogf OpenGithubFile


highlight ShitWhitespace ctermbg=red guibg=red
au InsertEnter * match ShitWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ShitWhitespace /\s\+$/

au InsertEnter * set cursorline
au InsertLeave * set nocursorline

