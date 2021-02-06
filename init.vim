augroup VimStartup
    " netrw
    au!
    "au VimEnter * if expand("%") == "" | Lexplore! | endif
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
autocmd BufEnter * call SignFileType()
augroup vimrcIncsearchHighlight
    " highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

let mapleader=" "
map ; :
map - $
"the m is marks
"map m z
map R <C-r>
"inoremap <C-tab> <C-p>
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
map <LEADER>k :!mkdir -p %:h
map <LEADER>t :terminal<CR>
map <LEADER>a za
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv
" the Q is used to go into Ex mode
"map Q Q
" the exit command like wq ,but terminal mode is like q
map <LEADER>q :exit<CR>
" default <HOME>
map H :vertical resize -10<CR>
map J :below resize -10<CR>
map K :below resize +10<CR>
" default <Bottom>
map L :vertical resize +10<CR>
" default To Middle line of window
map M :make %<CR>


map <LEADER>n :Lexplore!<CR>
map <LEADER>- :tabprevious<CR>
map <LEADER>= :tabnext<CR>
map <LEADER>[ :bprevious<CR>
map <LEADER>] :bnext<CR>
tmap <ESC> <C-\><C-n>

if &filetype != 'vimwiki'
inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap { {}<ESC>i
inoremap [ []<ESC>i
inoremap ( ()<ESC>i
endif

set helplang=cn
set langmenu=zh_CN.UTF-8
set backspace=indent,eol,start
set ruler
syntax on
set confirm
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

set autoindent
set smartindent

if has('nvim')
    " this is only used in neovim
    set scrolloff=4
    set scrolljump=0
    set scrollback=4
endif

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

" be used to bash user-defined alias
set shellcmdflag=-ic
set spelllang=en
set nospell

set foldenable
set foldcolumn=0
set foldmethod=indent
set foldlevel=5

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'edkolev/tmuxline.vim'
"Plug 'voldikss/vim-floaterm'
Plug 'zxm66/potential-meme'
Plug 'terryma/vim-multiple-cursors'
Plug 'voldikss/vim-translator'
call plug#end()

if line('$') < 1000
    " when the line is so big and the save motion is so slow
    "autocmd BufWrite * execute('Autoformat')
endif
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
        " use the regix expression to change the first character to "
        nnoremap <buffer> <C-/> <ESC>:s/^/"/g<CR>
    elseif &filetype == 'java'
        " Use VIM to write java progress
        set path=.,**
        set path+=$JAVA_HOME/src/**
        " custom the make
        set makeprg=java14
        " only bring into effect on current buffer
        nnoremap <buffer> im /import<CR>N$a<CR>import<space>;<left>
        nnoremap <buffer> <C-/> <ESC>:s/^/\/\//g<CR>
        nnoremap <buffer> F- 0f-2xi
        nnoremap <buffer> f- f-2xi
        " use the // to  annotation code lead to single / become slow
        "nnoremap // 0i//<ESC>:Autoformat<CR>
        "vnoremap // 0I//<ESC>:Autoformat<CR>

        " must create a habit, and not more and more alter or update the vim
        " setting file
        if  !exists('g:idea_vimrc')
            " Only edit java code by vim
            inoremap <buffer> <silent> sout System.out.println(--);<ESC>
            inoremap <buffer> <silent> pv- @Test<CR>public void --(){<CR>}<ESC>
            "" you should use the psvm to instead of the main method code fragment rather than using the main.
            inoremap <buffer> <silent> psvm public static void main(String[] args){<CR>}<ESC>
            inoremap <buffer> <silent> m-nh Map<String,Object> -- = new HashMap<String,Object>();<ESC>
            inoremap <buffer> <silent> l-na List<Object> -- = new ArrayList<Object>();<ESC>
            inoremap <buffer> <silent> ijum import java.util.Map;<CR>import java.util.HashMap;<ESC>
            inoremap <buffer> <silent> ijul import java.util.List;<CR>import java.util.ArrayList;<ESC>
            inoremap <buffer> <silent> pc- public class -- {<CR>}<ESC>
            inoremap <buffer> <silent> pS- private String --;<ESC>
            inoremap <buffer> <silent> pI- private Integer --;<ESC>
            inoremap <buffer> <silent> ttnt Thread thread = new Thread(--);<ESC>
            inoremap <buffer> <silent> iosbfa import org.springframework.beans.factory.annotation.--;<CR>
            inoremap <buffer> <silent> ioswba import org.springframework.web.bind.annotation.--;<CR>
            inoremap <buffer> <silent> ioss import org.springframework.stereotype.--;<CR>
        endif
    elseif &filetype == 'scala'
    elseif &filetype == 'js'
    elseif &filetype == 'md' || &filetype == 'vimwiki'
        map <silent> <Leader>v :VimwikiGoto<CR>
    endif
endfunction


if exists('g:idea_vimrc')
    " use IDEA plugin
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


