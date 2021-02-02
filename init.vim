augroup VimStartup
    au!
    au VimEnter * if expand("%") == "" | Lexplore! | endif
augroup END
let g:netrw_banner=0
let g:netrw_preview=1
let g:netrw_liststyle=3
let g:netrw_browse_split=0
let g:netrw_winsize=30

let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/bin/python2'

autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

augroup vimrcIncsearchHighlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

let mapleader=" "
map ; :
map - $
map s <nop>
nnoremap <silent> <expr>s col(".")==1?"$":"0"
vnoremap <silent> <expr>s col(".")==1?"$h":"0"
map cc <C-w>
map bg <C-z>
map gg <nop>
nnoremap <silent> <expr>gg line(".")==1?"G":"gg"
vnoremap <silent> <expr>gg line(".")==1?"G":"gg"

map <LEADER>rc :edit ~/.config/nvim/init.vim<CR>
map <LEADER>sc :so ~/.config/nvim/init.vim<CR>
map <LEADER>f :find<Space>

map <LEADER>b :buffer<Space>
map <LEADER>e :edit %:p:h
map <LEADER>t :terminal<CR>
map <LEADER>n :Lexplore!<CR>
map <LEADER>- :tabprevious<CR>
map <LEADER>= :tabnext<CR>
map <LEADER>[ :bprevious<CR>
map <LEADER>] :bnext<CR>
tmap <ESC> <C-\><C-n>
"inoremap <silent> <expr> <tab>  !matchstr(getline('.')[col('.') - 1],'[A-Za-z0-9]{1}')? "\t":"<C-p>"
function CursorChartoInt()
    return char2nr(tolower(getline('.')[col('.') - 1]))
endfunction
"inoremap <silent> <expr> <tab> (122 >= CursorChartoInt() && CursorChartoInt() >= 97) ?"\t":"<C-p>"
"inoremap <silent> <expr> cp "\t"

set helplang=cn
set langmenu=zh_CN.UTF-8
set ruler
"set syntax=on
set verbose=0
set complete-=i
set complete-=t
set completeopt=preview,menu
set ttyfast
set softtabstop=4
set tabstop=4
set smarttab
set expandtab
set shiftwidth=4

set smartindent
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
set noautoindent
set nosmartindent
set nowrap
set noautochdir

set nospell

set foldenable
set foldcolumn=0
set foldmethod=indent
set foldlevel=3

"set backupext=.bak
set nobackup
set nowritebackup
set noswapfile
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on


if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirshttps://raw.GitHub.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin("~/.config/nvim/plugged")
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'voldikss/vim-floaterm'
Plug 'terryma/vim-multiple-cursors'
Plug 'voldikss/vim-translator'
call plug#end()

autocmd BufWrite * execute('Autoformat')
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV
nmap <silent> <Leader>x <Plug>TranslateX

function SignFileType()
    if &filetype == 'c' || &filetype == 'h'
    elseif &filetype =='cpp'
    elseif &filetype == 'python'
    elseif &filetype == 'vim'
    elseif &filetype == 'java'
        set path=.,**
        set path+=$JAVA_HOME/src/**
        nnoremap im /import<CR>N$a<CR>import<space>;<left>
        nnoremap // <ESC>:s/^/\/\//g<CR>
        "nnoremap // 0i//<ESC>:Autoformat<CR>
        "vnoremap // 0I//<ESC>:Autoformat<CR>

        inoremap <silent> sout System.out.println("");
        inoremap <silent> main public void static main(String[] args){}
        inoremap <silent> hashmap Map<String,Object> map = new HashMap<String,Object>();
        inoremap <silent> newlist List<Object> list = new ArrayList<Object>();
        inoremap <silent> imlist import java.util.List<CR>import java.util.ArrayList;
        inoremap <silent> newth Thread thread = new Thread();

    elseif &filetype == 'scala'
    elseif &filetype == 'js'
    endif
endfunction



if exists('g:idea_vimrc')
    nnoremap ; :action RunAnything<cr>
    set keep-english-in-normal
    set keep-english-in-normal-and-restore-in-insert
    noremap gf <ESC>:action GotoFile<CR>
    noremap <leader>` <ESC>:action SelectInProjectView<CR>
    nnoremap <C-l> <Right>
    nnoremap <C-j> <Down>
    nnoremap <C-h> <Left>
    nnoremap <C-k> <Up>
    nnoremap <C-O> <ESC>:action Back<CR>
    nnoremap <C-I> <ESC>:action Forward<CR>
    nnoremap <LEADER>ga :action  GotoAction<CR>
    nnoremap <LEADER>nb :action ActivateNavBar<CR>
    nnoremap <LEADER>l :action ShowPopupMenu<cr>
    nnoremap <LEADER>q :action CloseContent<cr>
    nnoremap <LEADER>Q :action ReopenClosedTab<cr>
    nnoremap <LEADER>\ :action VimFilePrevious<cr>
    nnoremap <LEADER>e :action SearchEverywhere<cr>
    nnoremap <LEADER>E :action Switcher<cr>
    nnoremap <LEADER>fs :action FileStructurePopup<cr>
    nnoremap <LEADER>gs :action GotoSymbol<cr>
    nnoremap <LEADER>se :action SearchEverywhere<cr>
    nnoremap <LEADER>1 :action   GoToTab1<cr>
    nnoremap <LEADER>2 :action   GoToTab2<cr>
    nnoremap <LEADER>3 :action   GoToTab3<cr>
    nnoremap <LEADER>4 :action   GoToTab4<cr>
    nnoremap <LEADER>5 :action   GoToTab5<cr>
    nnoremap <LEADER>6 :action   GoToTab6<cr>
    nnoremap <LEADER>7 :action   GoToTab7<cr>
    nnoremap <LEADER>8 :action   GoToTab8<cr>
    nnoremap <LEADER>9 :action   GoToTab9<cr>
    nnoremap <LEADER>b    :action HideActiveWindow<cr>
    nnoremap <LEADER>sc   <ESC>:action IdeaVim.ReloadVimRc.reload<cr>
    nnoremap <LEADER>-    :action NextTab<cr>
    nnoremap <LEADER>=   :action PreviousTab<cr>
    nnoremap <LEADER>r    :action ReformatCode<cr>
    nnoremap <LEADER>f   :action ToggleFullScreen<cr>
    nnoremap <LEADER>z   :action ToggleZenMode<cr>
endif


