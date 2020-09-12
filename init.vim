
" <leader> = <space>
let mapleader=" "
set updatetime=100
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
"set cursorcolumn
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
" set autochdir
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


" set fillchars=vert:^
set splitright
set splitbelow
map sj :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sl :set splitbelow<CR>:split<CR>
highlight VertSplit guifg=#2e3330 guibg=#688060 ctermfg=236 ctermbg=65
" 这行命令我想改成异步执行的
map lg :!git status && git add . && git commit -a -m "gc" && git pull && git push <CR>


map s <nop>
map <LEADER>ac :set autochdir!<CR>
map <LEADER>s :nohlsearch<CR>
map <LEADER>w :set nowrap!<CR>
map <LEADER><LEADER>s :set spell!<CR>

map tt :terminal<CR>
map <LEADER>b :BufOnly<CR>
map <LEADER>q :bdelete %<CR>
map <LEADER>n :NERDTreeToggle .<CR>
" map <LEADER>n :Defx -columns=icons:indent:filename:type -split=vertical -winwidth=50 -direction=topleft<CR>
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
noremap 'af :Autoformat<CR>

map 't :FloatermToggle<CR>
command! VimConfig :execute 'edit ~/.config/nvim/init.vim'

" coc-nvim
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" autocmd FileType java nested :TagbarOpen
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
map <LEADER>t :TagbarToggle<CR>

noremap <LEADER>c  :CocList<CR>
map <C-f> :FZF<CR>
map ff :FZF<CR>

map <LEADER>f :FZF<CR>
execute 'source ~/.config/nvim/plugin.vim'
execute 'source ~/.config/nvim/defx.vim'
