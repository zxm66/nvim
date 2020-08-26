
" <leader> = <space>
let mapleader=" "
set mouse=a
set tabstop=4
set smarttab
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set smartindent
set encoding=utf-8
set shortmess=atI
set clipboard+=unnamed
set number
set relativenumber
set cursorline
" set cursorcolumn
set scrolloff=5

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


set fillchars=vert:$
set splitright
set splitbelow
map sj :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sl :set splitbelow<CR>:split<CR>
highlight VertSplit guifg=#2e3330 guibg=#688060 ctermfg=236 ctermbg=65

map lg :!git status && git add . && git commit -a -m "gc" && git pull && git push <CR>


map s <nop>
map <LEADER>s :nohlsearch<CR>

map tt :terminal<CR>

inoremap <C-q> <ESC>

noremap ; :
noremap - $
noremap J <PageDown>
noremap H :vertical resize+10<CR>
noremap K <PageUp>
noremap L :vertical resize-10<CR>
noremap cc <C-w>
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
noremap <LEADER>sc :source ~/.config/nvim/init.vim<CR>
command! VimConfig :execute 'edit ~/.config/nvim/init.vim'

call plug#begin("~/.config/nvim/plugged")
" Plug 'voldikss/vim-floaterm'

Plug 'tpope/vim-surround'
"Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'

" Autoformat
Plug 'Chiel92/vim-autoformat'
" Auto Complete
" Plug 'Valloric/YouCompleteMe'
" Plug 'puremourning/vimspector'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'honza/vim-snippets'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-pathogen'

Plug 'mhinz/vim-startify'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
" Plug 'connorholyday/vim-snazzy'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" Git
" Plug 'airblade/vim-gitgutter'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" markdown
" Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
" Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
" Plug 'vimwiki/vimwiki'
" HTML, CSS, JavaScript, PHP, JSON, etc.
" Plug 'elzr/vim-json'
" Plug 'othree/html5.vim'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
" Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
" Plug 'mattn/emmet-vim'
" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

call plug#end()



" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki

" coc-nvim
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"
" tagbar
"
" autocmd FileType java nested :TagbarOpen
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
map <LEADER>t :TagbarToggle<CR>

"
" markdown
"
let g:mkdj_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1,
			\ 'sequence_diagrams': {},
			\ 'flowchart_diagrams': {},
			\ 'content_editable': v:false
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = '8888'
let g:mkdp_page_title = '「${name}」'

execute 'source ~/.config/nvim/airline.vim'
execute 'source ~/.config/nvim/coc.vim'
execute 'source ~/.config/nvim/filetype.vim'

noremap <LEADER>c  :CocList<CR>
map <C-f> :FZF<CR>
map ff :FZF<CR>
map <LEADER>f :FZF<CR>

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
" let g:NERDTreeDirArrowExpandable = '👉'
" let g:NERDTreeDirArrowCollapsible = '👇'
map <LEADER>n :NERDTreeToggle<CR>






