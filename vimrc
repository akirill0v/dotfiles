set backupdir=~/.vim/vimtmpdir,.
set directory=~/.vim/vimtmpdir,.
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" You can specify revision/branch/tag.
Plugin 'Shougo/vimshell', { 'rev' : '3787e5' }

" Plugins-------------------------------------
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'jeetsukumaran/vim-buffergator'

Plugin 'elzr/vim-json'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-git'
Plugin 'slim-template/vim-slim.git'
Plugin 'kchmck/vim-coffee-script'

Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'thoughtbot/vim-rspec'

Plugin 'chase/vim-ansible-yaml'

Plugin 'chrisbra/csv.vim'
Plugin 'dotcloud/docker', {'rtp': 'contrib/syntax/vim'}
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'

Plugin 'altercation/vim-colors-solarized'
Plugin 'endel/vim-github-colorscheme'

Plugin 'bogado/file-line'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'

Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-cucumber'
Plugin 'jiangmiao/auto-pairs'
Plugin 'henrik/vim-yaml-flattener'

Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
" All of your Plugins must be added before the following line
call vundle#end()            " required
" End Plugins---------------------------------

" Plugin Configs------------------------------
filetype plugin indent on

nnoremap <silent> <Leader>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "Dispatch rspec {spec}"

" Go
au BufRead,BufNewFile *.go set filetype=go

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
let g:go_snippet_engine = "neosnippet"

" Colorscheme
" let g:hybrid_use_iTerm_colors = 1
syntax enable
"set background=light
colorscheme github
" colorscheme solarized
"let g:solarized_termcolors=256
" End Plugin Configs--------------------------

filetype off

let mapleader=","

set nocompatible

set cursorline
set hidden
set expandtab
"set modelines=0
set shiftwidth=2
set clipboard=unnamed
"set synmaxcol=128
"set ttyscroll=10
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set nowrap
set number
"set expandtab
"set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

let g:buffergator_viewport_split_policy = "B"
let g:buffergator_sort_regime = "mru"

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

nnoremap <leader>fef :normal! gg=G``<CR>

nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader>e :NERDTreeToggle<CR>

nmap <silent> // :nohlsearch<CR>
noremap ,hl :set hlsearch! hlsearch?<CR>

" Allows you to enter sudo pass and save the file
" " when you forgot to open your file with sudo
cmap w!! %!sudo tee > /dev/null %

" Allow to copy/paste between VIM instances
" "copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" "copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" "paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>

" save changes
map <Leader>s :w<CR>
imap <Leader>s <ESC>:w<CR>
vmap <Leader>s <ESC><ESC>:w<CR>

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Map Goyo toggle to <Leader> + spacebar
nnoremap <Leader><Space> :Goyo<CR>
