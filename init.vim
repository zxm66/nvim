let mapleader=" "
" terminal 
let $TERM='iterm2'
" netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
" python
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/bin/python2'
colorscheme desert
set helplang=cn
set list
set encoding=utf-8
set number
set nowrap
set smartcase
set termguicolors
"set verbose=9

autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags

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
filetype on
filetype plugin on

set path+=**
set wildmenu
set wildignore=*.o,*.obj,*.class,*.bak,*/target/,*/out/,*/.vim/,*/.git/

set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set scrolloff=4

map ; :
map - $
map s <nop>
map <LEADER>n :Explore .<CR>
map <LEADER>f :find 
map <LEADER>s :nohlsearch<CR>
map <LEADER>t yaw<ESC>:!pbpaste \| say<CR>
map <LEADER>r :tabedit ~/.config/nvim<CR>:lcd ~/.config/nvim<CR>
map <LEADER>rc :edit ~/.config/nvim/init.vim<CR>
map <LEADER>sc :source ~/.config/nvim/init.vim<CR>
nmap N Nzz
nmap n nzz
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv


noremap H :vertical resize+10<CR>
noremap J :below resize+10<CR>
noremap <C-j> <PageDown>
noremap K :below resize-10<CR>
noremap <C-k> <PageUp>
noremap L :vertical resize-10<CR>
noremap <LEADER><CR> :CocFix<CR>
noremap <LEADER>c :CocList<CR>
noremap <LEADER>- :tabprevious<CR>
noremap <LEADER>= :tabNext<CR>
noremap <LEADER>[ :bprevious<CR>
noremap <LEADER>] :bNext<CR>
noremap <LEADER>m :call SetMakeprg()<CR>:make %<CR>
noremap <LEADER>q :bdelete % <CR>
noremap cc <C-w>
noremap co :copen 10<CR>
noremap lg :terminal lazygit<CR>i
noremap fm :terminal vifm .<CR>
noremap tt :terminal <CR>i

tnoremap <Esc> <C-\><C-n>

nnoremap <buffer> <LEADER>i :!./% <CR>
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

" 现在存在一个问题是第三方插件在修改这个path
function SetPath()
	if &filetype=='java'
		set path=.,**,~/sourceSpace/jdk/src/**
	elseif &filetype == 'python'
		set path=.,**,~/Library/Python/3.7/lib/python/site-packages/**
	endif
endfunction



autocmd FileType scala nnoremap <buffer> <LEADER>i :!scala %<CR>
autocmd FileType c nnoremap <buffer> <LEADER>i :!gcc % && ./a.out && rm ./a.out <CR>
autocmd FileType cpp nnoremap <buffer> <LEADER>i :!g++ % && ./a.out && rm ./a.out <CR>
autocmd FileType python nnoremap <buffer> <LEADER>i :!python3 % <CR>
autocmd FileType sh nnoremap <buffer> <LEADER>i :sh % <CR>
autocmd FileType go nnoremap <buffer> <LEADER>i :!go run % <CR>
autocmd FileType java nnoremap <buffer> <LEADER>i :!/Users/zhangxiaomin/Library/Java/JavaVirtualMachines/jdk-14.0.1+7/Contents/Home/bin/java % <CR>
autocmd FileType rust nnoremap <buffer> <LEADER>i :!cargo run <CR>
autocmd FileType javascript nnoremap <buffer> <LEADER>i :!node % <CR>
autocmd FileType vim,zsh,tmux nnoremap <buffer> <LEADER>i :source % <CR>
"autocmd FileType java set path+=~/sourceSpace/jdk/src/**
"autocmd FileType python set path+=~/Library/Python/3.7/lib/python/site-packages/**
autocmd FileType * call SetPath()



autocmd BufNewFile *.java 0r ~/.config/nvim/template/java.tpl | autocmd! BufNewFile
autocmd BufNewFile *.py 0r ~/.config/nvim/template/python.tpl | autocmd! BufNewFile
autocmd BufNewFile *.go 0r ~/.config/nvim/template/golang.tpl | autocmd! BufNewFile
autocmd BufNewFile *.c 0r ~/.config/nvim/template/c.tpl | autocmd! BufNewFile
autocmd BufNewFile *.cpp 0r ~/.config/nvim/template/cpp.tpl | autocmd! BufNewFile
autocmd BufNewFile *.rs 0r ~/.config/nvim/template/rust.tpl | autocmd! BufNewFile
autocmd BufNewFile *.html 0r ~/.config/nvim/template/html.tpl | autocmd! BufNewFile
autocmd BufNewFile *.js 0r ~/.config/nvim/template/javascript.tpl | autocmd! BufNewFile


