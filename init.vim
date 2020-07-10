
" <leader> = <space>
let mapleader=" "
set mouse=a
set tabstop=4
set smarttab 
set smartindent
set encoding=utf-8

set number
set relativenumber
set cursorline
" set cursorcolumn

set nobackup
set nowritebackup
set	noswapfile

set showcmd
set cmdheight=2

set showmode
set wildmenu
set smartcase
set wrap
set autochdir
set background=light

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

set foldenable
set foldmethod=indent
set foldlevel=99
let g:Foldmethod=0

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

syntax on

map sj :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sl :set splitbelow<CR>:split<CR>

map ga :!git add .<CR>
map gc :!git commit -a -m "gc"<CR>
map gl :!git pull<CR>
map gs :!git push<CR>


map s <nop>
map <LEADER>s :nohlsearch<CR>
map <C-h> :tabprevious<CR>
map <C-l> :tabNext<CR>
map <C-s> :w<CR>
map ww :w<CR>
map qq :q<CR>
map <LEADER>q :q<CR>

noremap J 5j
noremap H 5h
noremap K 5k
noremap L 5l
noremap cc <C-w>
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
noremap <LEADER>sc :source ~/.config/nvim/init.vim<CR>



call plug#begin()
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
" Autoformat
Plug 'Chiel92/vim-autoformat'
" Auto Complete
" Plug 'Valloric/YouCompleteMe'
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
" Plug 'connorholyday/vim-snazzy'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Git
" Plug 'airblade/vim-gitgutter'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'
" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

call plug#end()

noremap <LEADER>c  :CocList<CR>



map <C-n> :NERDTreeToggle<CR>
map <C-f> :FZF<CR>
map ff :FZF<CR>


map <LEADER>w :w<CR>
map <LEADER>f :FZF<CR>
map <LEADER>n :NERDTreeToggle<CR>

let g:markdown_fenced_languages = ['css', 'js=javascript']


" ==
" == NERDTree-git
" ==

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = ""
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = ""
let NERDTreeMapOpenInTab = ""
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = ""
let NERDTreeMapChangeRoot = ""


