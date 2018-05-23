set nocompatible              " be iMproved, required
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
Plugin 'chankaward/vim-railscasts-theme'
Plugin 'jdc0589/flatlandia'
Plugin 'scrooloose/nerdTree'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'PProvost/vim-ps1.git'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-sleuth'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'
Plugin 'pangloss/vim-javascript'
Plugin 'kshenoy/vim-signature'
Plugin 'fweep/vim-tabber'
Plugin 'vim-ruby/vim-ruby'
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
"
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
let g:rspec_command = "!clear && echo {spec} && bundle exec rspec {spec}"

let mapleader=","

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

colorscheme flatlandia
set number

set hlsearch
set splitbelow
set splitright
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-h> <C-W><C-H>
nnoremap <C-l> <C-W><C-La

" cause I hit shift every time by mistake somehow
cnoreabbrev W w  

set tabline=%!tabber#TabLine()

highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
