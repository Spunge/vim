set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" NOTE: comments after Bundle command are not allowed..
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Github repos
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-misc'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-markdown'
Bundle 'mattn/zencoding-vim'
Bundle 'bling/vim-bufferline'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-surround'

" vim-scripts repos
Bundle 'AutoClose'

" Non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on " required!

" Solarized settings
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colo solarized 

set encoding=utf-8
set cpoptions+=$
set gcr=a:blinkon0
set autoindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set nowrap
set hlsearch
set incsearch
set ignorecase
set number
set guioptions-=T
syntax on

set hidden		" allow buffers with unsaved changes
set mouse=a		" enable mouse scrolling and clicking in iTerm
set wildmenu	" expand vim commands like :tabe
set wildmode=full
set scrolloff=4	" keep 4 lines off the edges of the screen when scrolling
set nobackup	" no backup file clutter
set noswapfile	" never used it
set nomodeline	" ignore vim modelines
set laststatus=2 " always show statusline

" remap buffer switching
nnoremap <silent> <C-k> :bn<CR>
nnoremap <silent> <C-j> :bp<CR>
" remap tab switching
nnoremap <silent> <C-l> :tabn<CR>
nnoremap <silent> <C-h> :tabp<CR>

map <C-n> :NERDTreeToggle<CR>

" Make enter & shift enter insert a newline without entering insert mode
map <S-Enter> O<Esc>
map <CR> o <Esc>

let mapleader=","
" map <leader>/ to turn off search highlight
nnoremap <Leader>/ :noh<CR>
" Make it easy to edit files from same directory as current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" set snippet dir
let g:snippets_dir = '~/code/dotfiles/vimsnippets/'

" Bufferline is also printing to statusline, do not want :F
let g:bufferline_echo = 0
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'
let g:airline_theme='badwolf'
let g:airline_powerline_fonts=1

" tagbar autofocus and autoclose
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_iconchars = ['▾', '▸']

let g:ctrlp_tabpage_position = 'ac'

" dont look at .hg dirs to decide where current working dir is, messes up with
" subrepos
let g:ctrlp_working_path_mode = '0'

" let easytags look for tags file in project
set tags=./.tags;
let g:easytags_dynamic_files = 1
" disable auto update because it seems to make vim lag
" (use :UpdateTags -R ./*)
let g:easytags_auto_update = 0
let g:easytags_auto_highlight = 0

" include local vim conf
let s:extrarc = expand($HOME . '/.vimrc.local')
if filereadable(s:extrarc)
    exec ':so ' . s:extrarc
endif

