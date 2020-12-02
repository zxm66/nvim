let mapleader=" "
" terminal
let $TERM='iterm2'
" netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
" python
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/bin/python2'
"colorscheme desert
set helplang=cn
set mouse=nv
" set list
set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50
set title titlestring=%<%F%=%l/%L-%P\ titelen=70
set encoding=utf-8
set number
set nowrap
set smartcase
set ignorecase
set showcmd
set cmdheight=1
set termguicolors
set fillchars=stl:\ ,stlnc:\ ,vert:│,fold:·,diff:-
set formatexpr=mylang#Format()
"set verbose=9

autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags

set smarttab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

hi Pmenu ctermfg=black ctermbg=gray  guibg=#444444
hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff
hi PmenuSbar ctermfg=8 ctermbg=5 guibg=#666666 guifg=#AAAAAA
hi PmenuThumb ctermfg=9 ctermbg=6  guibg=#777777 guifg=#BBBBBB

set clipboard+=unnamedplus

set autoindent
set smartindent

set nobackup
set nowritebackup
set noswapfile

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on


set path+=**
set wildmenu
set wildmode=list:full
set wildignore=*.o,*.obj,*.class,*.bak,*/target/,*/out/,*/.vim/,*/.git/

set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set ttyfast
set scrolloff=4
set scrolljump=0
set scrollback=4

set signcolumn=yes
set shortmess+=c
set showbreak=>\

map ; :
" map - $
" map s <nop>
noremap <expr>s col(".")==1?"$":"0"
vnoremap <expr>s col(".")==1?"$h":"0"
map <LEADER>n :Explore .<CR>
" 使用autoformat会自动将空格删除掉。所以使用<SPACE>
map <LEADER>f :find<SPACE>
map <LEADER>d :!mkdir -p<SPACE>
map <LEADER>e :edit %:p:h/
map <LEADER>s :nohlsearch<CR>
map <LEADER>t yaw<ESC>:!pbpaste \| say<CR>
map <LEADER>r :tabedit ~/.config/nvim<CR>:lcd ~/.config/nvim<CR>
map <LEADER>rc :edit ~/.config/nvim/init.vim<CR>
map <LEADER>sc :source ~/.config/nvim/init.vim<CR>
nmap bd :%bdelete<CR>
nmap N Nzz
nmap n nzz
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv
vmap <LEADER>/ <C-v>0I//<ESC>

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
noremap af :Autoformat<CR>
noremap cc <C-w>
noremap co :copen 10<CR>
noremap lg <C-w>v<Esc>:terminal lazygit<CR>
noremap fm <C-w>v<Esc>:terminal vifm .<CR>
noremap tt <C-w>v<Esc>:terminal <CR>i
" 现在需要解决的一个问题是vim嵌套，termnal的vim不能保存输入。或者是进不了normal模式
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
"Plug 'tpope/vim-surround'
"Plug 'gcmt/wildfire.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'voldikss/vim-floaterm'
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
call plug#end()

" 最好是quickfix这个东西可以有索引，然后直接跳转到对应的位置上就好了。
function SetMakeprg()
    if &filetype == 'c'
        set makeprg=gcc
    elseif &filetype =='cpp'
        set makeprg=g++
    elseif &filetype == 'python'
        set makeprg=python3
    elseif &filetype == 'vim'
        set makeprg=source
    elseif &filetype == 'java'
        set makeprg=~/Library/Java/JavaVirtualMachines/jdk-14.0.1+7/Contents/Home/bin/java
    elseif &filetype == 'scala'
        set makeprg=scala
    elseif &filetype == 'js'
        set makeprg=node
    endif
endfunction

function SignDefine()
    if &filetype == 'c' || &filetype == 'h'
    elseif &filetype =='cpp'
    elseif &filetype == 'python'
    elseif &filetype == 'vim'
    elseif &filetype == 'java'
    elseif &filetype == 'scala'
    elseif &filetype == 'js'
    endif
endfunction

" 根据不同的文件类型，控制当前的path。直接重置path，禁止第三方插件对path的修改。
function SetPath()
    if &filetype=='java'
        set path=.,**,~/sourceSpace/jdk/src/**
        set path+=~/Library/Java/JavaVirtualMachines/jdk8u252-b09/Contents/Home/include/**
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
autocmd FileType html nnoremap <buffer> <leader>i :!/Applications/Firefox.app/Contents/MacOS/firefox-bin %:p<CR>
autocmd FileType * call SetPath()
autocmd FileType * call SignDefine()
" autocmd BufWrite * execute('Autoformat')
autocmd TermOpen * set nonumber

autocmd BufNewFile *.java 0r ~/.config/nvim/template/java.tpl | autocmd! BufNewFile
autocmd BufNewFile *.py 0r ~/.config/nvim/template/python.tpl | autocmd! BufNewFile
autocmd BufNewFile *.go 0r ~/.config/nvim/template/golang.tpl | autocmd! BufNewFile
autocmd BufNewFile *.c 0r ~/.config/nvim/template/c.tpl | autocmd! BufNewFile
autocmd BufNewFile *.cpp 0r ~/.config/nvim/template/cpp.tpl | autocmd! BufNewFile
autocmd BufNewFile *.rs 0r ~/.config/nvim/template/rust.tpl | autocmd! BufNewFile
autocmd BufNewFile *.html 0r ~/.config/nvim/template/html.tpl | autocmd! BufNewFile
autocmd BufNewFile *.js 0r ~/.config/nvim/template/javascript.tpl | autocmd! BufNewFile

augroup java_class
    autocmd!
    autocmd BufEnter *.class !javap -v % | less
    autocmd BufEnter *.class bdelete
augroup end
" vim的term终端应该不是item2，然后是不能显示图片,还有是这个less没有起作用。
" 可以使用vim吊起预览的命令不一定使用imgcat打印在终端。
augroup image
    autocmd!
    autocmd BufEnter *.jpg !imgcat  %
    autocmd BufEnter *.jpg bdelete
augroup end


imap <C-l> <Plug>(coc-snippets-expand)

vmap <C-j> <Plug>(coc-snippets-select)

let g:coc_snippet_next = '<C-j>'

let g:coc_snippet_prev = '<C-k>'

imap <C-j> <Plug>(coc-snippets-expand-jump)


inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


let g:coc_snippet_next = '<tab>'

let g:coc_global_extensions=['coc-cfn-lint','coc-clangd','coc-db','coc-emmet','coc-explorer','coc-git','coc-go','coc-highlight','coc-html','coc-java','coc-java-debug','coc-java-lombok','coc-jedi','coc-json','coc-lists','coc-marketplace','coc-markmap','coc-metals','coc-pairs','coc-pyright','coc-python','coc-snippets','coc-terminal','coc-todolist','coc-translator','coc-tsserver','coc-twitch-highlight','coc-vimlsp','coc-xml','coc-yank']

" 现在需要处理的一件事情，是将命令行的窗口，做个置顶的操作，最下边是有点看着不舒服
" Use tab for trigger completion with character ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" verbose 冗长的，记录日志用的吧。这是猜测的。
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.使用C-r重新触发自动补全。
if has('nvim')
    inoremap <silent><expr> <C-r> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" silent 不增加信息历史。
nmap <silent> 'p <Plug>(coc-diagnostic-prev)
nmap <silent> 'n <Plug>(coc-diagnostic-next)


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> M :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['im','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction


augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end




if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰ '
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_count = 2
let g:airline#extensions#tabline#excludes = []
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
let g:airline#extensions#coc#enabled = 0
let g:airline#extensions#coc#error_symbol = 'Error:'
let g:airline#extensions#coc#warning_symbol = 'Warning:'
let g:airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let g:airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#nerdtree_status = 1
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let airline#extensions#ale#show_line_numbers = 1
let airline#extensions#ale#open_lnum_symbol = '(L'
let airline#extensions#ale#close_lnum_symbol = ')'

let g:airline#extensions#tmuxline#enabled = 0
let airline#extensions#tmuxline#color_template = 'normal'
let airline#extensions#tmuxline#snapshot_file =  "~/.tmux-statusline-colors.conf"

if exists('g:idea_vimrc')
    set cmdheight=2
    nnoremap <LEADER>sc :source  ~/.ideavimrc<cr>
    " options
    nnoremap cow :action EditorToggleUseSoftWraps<cr>
    nnoremap col :action EditorToggleShowWhitespaces<cr>
    " actions
    " 右键菜单
    nnoremap <LEADER>l :action ShowPopupMenu<cr>
    " 关闭当前文件
    nnoremap <LEADER>q :action CloseContent<cr>
    nnoremap <LEADER>Q :action ReopenClosedTab<cr>
    nnoremap <LEADER>\ :action VimFilePrevious<cr>
    nnoremap <LEADER>e :action SearchEverywhere<cr>
    nnoremap <LEADER>E :action Switcher<cr>
    nnoremap <LEADER>t :action FileStructurePopup<cr>
    nnoremap <LEADER>T :action GotoSymbol<cr>
    nnoremap <LEADER>a :action GotoAction<cr>
    nnoremap <LEADER>b :action ToggleLineBreakpoint<cr>
    " code navigation
    nnoremap <LEADER>] :action GotoImplementation<cr>
    nnoremap <LEADER>[ :action GotoSuperMethod<cr>
    nnoremap <LEADER>u :action FindUsages<cr>
    nnoremap <LEADER>gt :action GotoTest<cr>
    nnoremap <LEADER>k :action HighlightUsagesInFile<cr>
    nnoremap \r :action RunClass<cr>
    nnoremap \R :action Run<cr>
    nnoremap \d :action DebugClass<cr>
    nnoremap \D :action Debug<cr>
    nnoremap \c :action CheckStyleCurrentFileAction<cr>
    " code refactoring
    nnoremap <LEADER>rr :action RenameElement<cr>
    " unimpaired mappings
    nnoremap [<LEADER> O<esc>j
    nnoremap ]<LEADER> o<esc>k
    nnoremap [q :action PreviousOccurence<cr>
    nnoremap ]q :action NextOccurence<cr>
    nnoremap [m :action MethodUp<cr>
    nnoremap ]m :action MethodDown<cr>
    nnoremap [c :action VcsShowPrevChangeMarker<cr>
    nnoremap ]c :action VcsShowNextChangeMarker<cr>
    " built-in navigation to navigated items works better
    nnoremap <c-o> :action Back<cr>
    nnoremap <c-i> :action Forward<cr>
    " but preserve ideavim defaults
    nnoremap g<c-o> <c-o>
    nnoremap g<c-i> <c-i>
    " built in search looks better
    nnoremap / :action Find<cr>
    " but preserve ideavim search
    nnoremap g/ /
    "    Activateinternal-profilerToolWindow
    noremap <LEADER>m   :action ActivateMavenToolWindow<cr>
    "    ActivateNavBar
    "    ActivateProblemsViewToolWindow                     <M-6>
    "    ActivateProjectToolWindow                          <M-1>
    nnoremap <LEADER>n  :action ActivateProjectToolWindow<cr>
    "    ActivatePullRequestsToolWindow
    "    ActivateRunToolWindow                              <M-4>
    "    ActivateServicesToolWindow                         <M-8>
    "    ActivateStructureToolWindow                        <M-7>
    noremap tt   :action ActivateTerminalToolWindow<cr>
    nnoremap <LEADER>-   :action GotoPreviousBookmark<cr>
    "    GotoPreviousError                                  <S-F2>
    "    GotoRelated                                        <M-C-Up>
    "    GotoSuperMethod                                    <M-U>
    "    GotoSymbol                                         <M-A-O>
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
    "    HideAllWindows                                     <M-S-F12>
    "    HideCoverage
    "    HideSideWindows
    "    idea.java.decompiler.action.group
    "    IdeaVim.ReloadVimRc.group
    nnoremap <LEADER>sc   <ESC>:action IdeaVim.ReloadVimRc.reload<cr>
    "    NextProjectWindow                                  <M-A-À>
    "    NextSplitter                                       <A-Tab>
    nnoremap <LEADER>-    :action NextTab<cr>
    "    PreviousOccurence                                  <M-A-Up>
    "    PreviousProjectWindow                              <M-A-S-À>
    nnoremap <LEADER>=   :action PreviousTab<cr>

    "    Refactorings.QuickListPopupAction                  <C-T>
    nnoremap <LEADER>r    :action ReformatCode<cr>
    "    Terminal.NextSplitter                              <A-Tab>
    "    Terminal.OpenInTerminal
    nnoremap <LEADER>f   :action ToggleFullScreen<cr>
    nnoremap <LEADER>z   :action ToggleZenMode<cr>
    nnoremap <LEADER>z    :action ZoomCurrentWindow<cr>
endif

