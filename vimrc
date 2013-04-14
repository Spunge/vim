set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'xolox/vim-easytags'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'rson/vim-bufstat'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-markdown'
Bundle 'mattn/zencoding-vim'
Bundle 'docunext/closetag.vim'
Bundle 'tpope/vim-surround'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'Lokaltog/powerline'
"Bundle 'Lokaltog/vim-powerline'
"Bundle 'sjbach/lusty'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'spf13/PIV'

" vim-scripts repos
Bundle 'AutoClose'
"Bundle 'L9'
"Bundle 'FuzzyFinder'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!

" NOTE: comments after Bundle command are not allowed..

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
"set clipboard+=unnamed " use system clipboard for yanking text

" Custom statusline
let g:bufstat_active_hl_group = "Comment"
"let g:bufstat_inactive_hl_group = "Statement"
let g:bufstat_inactive_hl_group = "LineNr"
let g:bufstat_number_before_bufname = 0
let g:bufstat_alternate_list_char = ''
let g:bufstat_surround_flags = ':'

" Statusline stuff alex made, TODO go use tabs u silly
set statusline=
set statusline+=%=	 "the right part
set statusline+=%m	 "modified flag
set statusline+=\ L%l:C%c   "line number and columns
set statusline+=\ %P\    "percentage thru file
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" faster buffer switching
nnoremap <silent> <C-l> :bn<CR>
nnoremap <silent> <C-h> :bp<CR>

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

