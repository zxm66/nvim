augroup VimStartup
	au!
	au VimEnter * if expand("%") == "" | Lexplore! | endif
augroup END
let g:netrw_banner=0
let g:netrw_preview=1
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=30

autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

let mapleader=" "
map ; :
map - $
map s <nop>
map cc <C-w>
map <LEADER>rc :edit ~/.config/nvim/init.vim<CR>
map <LEADER>sc :so ~/.config/nvim/init.vim<CR>
map <LEADER>f :find<Space>
map <LEADER>t :terminal<CR>
map <LEADER>n :Lexplore!<CR>
map <LEADER>- :tabprevious<CR>
map <LEADER>= :tabnext<CR>
map <LEADER>[ :bprevious<CR>
map <LEADER>] :bnext<CR>
tmap <ESC> <C-\><C-n>
imap <tab> <C-p>



set verbose=0
set complete-=i
set complete-=t
set ttyfast
set scrolloff=4
set scrolljump=0
set scrollback=4
set signcolumn=yes
set shortmess+=c
set showbreak=>\

set path+=**
set wildmenu
set wildmode=list:full
set wildignore=*.o,*.obj,*.class,*.bak,*/target/,*/out/,*/.vim/,*/.git/
set clipboard+=unnamedplus
set autoindent
set smartindent
set noautochdir
set nobackup
set nowritebackup
set noswapfile
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on


if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
				\https://raw.GitHub.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin("~/.config/nvim/plugged")
Plug 'Chiel92/vim-autoformat'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'voldikss/vim-floaterm'
Plug 'terryma/vim-multiple-cursors'
Plug 'voldikss/vim-translator'
call plug#end()
