let mapleader=" "
" netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
" python
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/bin/python2'

set encoding=utf-8
set number
set nowrap
set smartcase
set termguicolors
set cursorline

set smarttab
set softtabstop=4
set tabstop=4
set shiftwidth=4

set clipboard+=unnamedplus

set autoindent
set smartindent

set nobackup
set nowritebackup
set noswapfile

set nocompatible
filetype plugin on

set path+=**
set wildmenu
set wildignore=*.o,*.obj,*.class,*.bak,*/target/,*/out/,*/.vim/,*/.git/

set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

map ; :
map - $
noremap , !
noremap . %
map s <nop>
map <LEADER>n :Explore .<CR>
map <LEADER>f :find 
map <LEADER>s :nohlsearch<CR>
map <LEADER>t yaw<ESC>:!pbpaste \| say<CR>
map <LEADER>r :tabedit ~/.config/nvim<CR>:lcd ~/.config/nvim<CR>
map <LEADER>rc :edit ~/.config/nvim/init.vim<CR>
map <LEADER>sc :source ~/.config/nvim/init.vim<CR>
noremap H :vertical resize+10<CR>
noremap J :below resize+10<CR>
noremap <C-j> <PageDown>
noremap K :below resize-10<CR>
noremap <C-k> <PageUp>
noremap L :vertical resize-10<CR>
noremap <LEADER>c :CocList<CR>
noremap <LEADER>- :tabprevious<CR>
noremap <LEADER>= :tabNext<CR>
noremap <LEADER>m :call SetMakeprg()<CR>:make %<CR>
noremap <LEADER>q :bdelete % <CR>
noremap cc <C-w>
noremap co :copen 10<CR>
noremap lg :terminal lazygit<CR>i
noremap fm :terminal vifm<CR>
noremap tt :terminal <CR>i

tnoremap <Esc> <C-\><C-n>

command! MakeTags :!ctags -R . <CR>

nmap <leader><leader>t <Plug>(coc-translator-p)
vmap <Leader><leader>t <Plug>(coc-translator-pv)
nmap <leader><Leader>e <Plug>(coc-translator-e)
vmap <leader><Leader>e <Plug>(coc-translator-ev)
nmap <leader><Leader>r <Plug>(coc-translator-r)
vmap <leader><Leader>r <Plug>(coc-translator-rv)

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs 
     \https://raw.GitHub.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin("~/.config/nvim/plugged")
	Plug 'Chiel92/vim-autoformat'
	Plug 'tpope/vim-surround'
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	"Plug 'puremourning/vimspector'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'airblade/vim-gitgutter'
	Plug 'terryma/vim-multiple-cursors'
call plug#end()


function SetMakeprg()
	if &filetype == 'c'
		set makeprg=gcc
	elseif &filetype =='cpp'
		set makeprg=g++
	elseif &filetype == 'python'
		set makeprg=python3
	elseif &filetype == 'vim'
		set makeprg=source
	endif
endfunction

