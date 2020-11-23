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
map - $
map s <nop>
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
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
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
autocmd BufWrite * execute('Autoformat')
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
    "    $Copy                                              <M-C>
    "    $Cut                                               <M-X> <S-Del>
    "    $Delete                                            <Del> <BS> <M-BS>
    "    $LRU
    "    $Paste                                             <M-V>
    "    $Redo                                              <M-S-Z> <A-S-BS>
    "    $SearchWeb
    "    $SelectAll                                         <M-A>
    "    $Undo                                              <M-Z>
    "    About
    "    AceAction                                          <C-;>
    "    AceDeclarationAction
    "    AceLineAction                                      <C-S-;>
    "    AceTargetAction                                    <A-C-;>
    "    AceWordAction
    "    AceWordBackwardsAction
    "    AceWordForwardAction
    "    Actions.ActionsPlugin.GenerateToString
    "
    "
    "
    "    ActivateAntToolWindow
    "    ActivateBuildToolWindow
    "    ActivateCommitToolWindow                           <M-0>
    "    ActivateDebugToolWindow                            <M-5>
    "    ActivateEventLogToolWindow
    "    ActivateFavoritesToolWindow                        <M-2>
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
    "    ActivateTODOToolWindow
    "    ActivateVersionControlToolWindow                   <M-9>
    "    ActiveToolwindowGroup
    "
    "
    "    AddAllToFavorites
    "    AddAntBuildFile
    "    AddFrameworkSupport
    "    AddGradleDslPluginAction
    "    AddNewFavoritesList
    "    AddNewPropertyFile
    "    AddToFavorites
    "    AddToFavoritesPopup                                <A-S-F>
    "    AddToProblemApiInspection
    "    Akka.GeneratePropsFactory
    "    AnalyzeActions
    "    AnalyzeJavaMenu
    "    AnalyzeMenu
    "    AnalyzePlatformMenu
    "    AnalyzePluginStartupPerformance
    "    AnalyzeStacktraceToolbar
    "    Annotate
    "    AnnotateStackTraceAction.show.files.modification.info
    "    AnonymousToInner
    "    AntBuildGroup
    "    Arrangement.Alias.Rule.Add                         <M-N> <C-CR>
    "    Arrangement.Alias.Rule.Context.Menu
    "    Arrangement.Alias.Rule.Edit                        <F2>
    "    Arrangement.Alias.Rule.Match.Condition.Move.Down   <A-Down>
    "    Arrangement.Alias.Rule.Match.Condition.Move.Up     <A-Up>
    "    Arrangement.Alias.Rule.Remove                      <Del> <BS> <M-BS>
    "    Arrangement.Alias.Rule.ToolBar
    "    Arrangement.Custom.Token.Rule.Edit
    "    Arrangement.Rule.Add                               <M-N> <C-CR>
    "    Arrangement.Rule.Edit                              <F2>
    "    Arrangement.Rule.Group.Condition.Move.Down         <A-Down>
    "    Arrangement.Rule.Group.Condition.Move.Up           <A-Up>
    "    Arrangement.Rule.Group.Control.ToolBar
    "    Arrangement.Rule.Match.Condition.Move.Down         <A-Down>
    "    Arrangement.Rule.Match.Condition.Move.Up           <A-Up>
    "    Arrangement.Rule.Match.Control.Context.Menu
    "    Arrangement.Rule.Match.Control.ToolBar
    "    Arrangement.Rule.Remove                            <Del> <BS> <M-BS>
    "    Arrangement.Rule.Section.Add
    "    AssociateWithFileType
    "    AttachIntellijSourcesAction
    "    AttachProject
    "    AutoIndentLines                                    <A-C-I>
    "    AutoShowProcessWindow
    "    Back                                               <M-[> <M-A-Left> button=4 clickCount=1 modifiers=0
    "    BackgroundTasks
    "    BasicEditorPopupMenu
    "    Bookmarks
    "    BraceOrQuoteOut                                    <Tab>
    "    BreakpointActionsGroup
    "    BuildArtifact
    "    BuildMenu
    "    ByeCodeViewerGroup
    "    ByteCodeDecompiler
    "    ByteCodeViewer
    "    CallHierarchy                                      <A-C-H>
    "    CallHierarchy.BaseOnThisMethod                     <A-C-H>
    "    CallHierarchyPopupMenu

    "    ChangeCodeStyleScheme
    "    ChangeColorScheme
    "    ChangeFileEncodingAction
    "    ChangeInspectionProfile
    "    ChangeKeymap
    "    ChangeLaf
    "    ChangeLineSeparators
    "    ChangesBrowser.FiltererGroup
    "    ChangeScheme
    "    ChangeSignature                                    <M-F6>
    "    ChangeSplitOrientation
    "    ChangesView.AddUnversioned                         <M-A-A>
    "    ChangesView.ApplyPatch
    "    ChangesView.ApplyPatchFromClipboard
    "    ChangesView.Browse
    "    ChangesView.CommitToolbar
    "    ChangesView.CreatePatch
    "    ChangesView.CreatePatchFromChanges
    "    ChangesView.CreatePatchToClipboard
    "    ChangesView.Diff                                   <M-D>
    "    ChangesView.Edit
    "    ChangesView.GroupBy
    "    ChangesView.GroupBy.Directory                      <C-P>
    "    ChangesView.GroupBy.Module                         <C-M>
    "    ChangesView.GroupBy.Repository
    "    ChangesView.Move                                   <M-S-M>
    "    ChangesView.NewChangeList
    "    ChangesView.Refresh
    "    ChangesView.RemoveChangeList
    "    ChangesView.RemoveDeleted
    "    ChangesView.Rename                                 <F2> <S-F6>
    "    ChangesView.Revert                                 <M-A-Z>
    "    ChangesView.SetDefault                             <C- >
    "    ChangesView.Shelve
    "    ChangesView.ShelveSilently                         <M-S-H>
    "    ChangesView.ShowCommitOptions
    "    ChangesView.ToggleCommitUi                         <M-K>
    "    ChangesView.UnshelveSilently                       <M-A-U>
    "    ChangesView.ViewOptions
    "    ChangesView.ViewOptions.ShowRelatedFiles
    "    ChangesViewPopupMenu
    "    ChangesViewToolbar
    "    ChangeTemplateDataLanguage
    "    ChangeTypeSignature                                <M-S-F6>
    "    ChangeView
    "    CheckForUpdate
    "    CheckinFiles
    "    CheckinProject                                     <M-K>
    "    CheckStatusForFiles
    "    ChooseDebugConfiguration                           <A-C-D>
    "    ChooseNextSubsequentPropertyValueEditorAction      <C-Down>
    "    ChoosePrevSubsequentPropertyValueEditorAction      <C-Up>
    "    ChooseRunConfiguration                             <A-C-R>
    "    ClassNameCompletion                                <A-C- >
    "    CleanPyc
    "    CloseActiveTab                                     <C-S-F4>
    "    CloseAllEditors
    "    CloseAllEditorsButActive
    "    CloseAllNotifications
    "    CloseAllReadonly
    "    CloseAllToTheLeft
    "    CloseAllToTheRight
    "    CloseAllUnmodifiedEditors
    "    CloseAllUnpinnedEditors
    "    CloseContent                                       <M-W>
    "    CloseEditor
    "    CloseEditorsGroup
    "    CloseFirstNotification
    "    CloseProject
    "    CodeCleanup
    "    CodeCompletion                                     <C- >
    "    CodeCompletionGroup
    "    CodeEditorBaseGroup
    "    CodeEditorViewGroup
    "    CodeFormatGroup
    "    CodeInsightEditorActions
    "    CodeInspection.OnEditor                            <A-S-I>
    "    CodeMenu
    "    CollapseAll                                        <M-m> <M-->
    "    CollapseAllRegions                                 <M-S-m> <M-S-->
    "    CollapseBlock                                      <M-S-.>
    "    CollapseDocComments
    "    CollapseExpandableComponent                        <S-CR> <M-m> <M-->
    "    CollapseRegion                                     <M-m> <M-->
    "    CollapseRegionRecursively                          <M-A-m> <M-A-->
    "    CollapseSelection                                  <M-.>
    "    CollapseTreeNode                                   <m>
    "    CollectZippedLogs
    "    com.jetbrains.python.console.RunPythonOrDebugConsoleAction
    "    CombinePropertiesFilesAction
    "    CommanderPopupMenu
    "    CommentByBlockComment                              <M-S-o> <M-S-o>
    "    CommentByLineComment                               <M-/> <M-o>
    "    CommentGroup
    "    CommittedChanges.Clear
    "    CommittedChanges.Details
    "    CommittedChanges.Filter
    "    CommittedChanges.Refresh
    "    CommittedChanges.Revert
    "    CommittedChangesToolbar
    "    Compare.LastVersion
    "    Compare.SameVersion
    "    Compare.Selected
    "    Compare.Specified
    "    CompareActions
    "    CompareClipboardWithSelection
    "    CompareDirs                                        <M-D>
    "    CompareFileWithEditor
    "    CompareTwoFiles                                    <M-D>
    "    Compile                                            <M-S-F9>
    "    CompileDirty                                       <M-F9>
    "    CompileProject
    "    CompilerErrorViewPopupMenu
    "    CompuleQrc
    "    ConfigureEditorTabs
    "    ConfigureIcs
    "    ConfigureKotlinInProject
    "    ConfigureKotlinJsInProject
    "    ConfigureSoftWraps
    "    Console.Execute                                    <CR>
    "    Console.Execute.Multiline                          <M-CR>
    "    Console.History.Browse                             <M-A-E>
    "    Console.History.Next
    "    Console.History.Previous
    "    Console.HistoryActions
    "    Console.Open                                       <M-S-F10>
    "    Console.SplitLine                                  <M-CR>
    "    ConsoleEditorPopupMenu
    "    ConsoleView.ClearAll
    "    ConsoleView.FoldLinesLikeThis
    "    ConsoleView.PopupMenu
    "    context.clear                                      <A-S-X>
    "    context.load
    "    context.save
    "    ContextHelp                                        <M-S-F1>
    "    ConvertFormToDslAction
    "    ConvertGroovyToJava
    "    ConvertIndentsGroup
    "    ConvertIndentsToSpaces
    "    ConvertIndentsToTabs
    "    ConvertJavaToKotlin                                <M-A-S-K>
    "    ConvertJavaToKotlinGroup
    "    ConvertModuleGroupsToQualifiedNames
    "    ConvertSchemaAction
    "    ConvertToCompileStatic
    "    ConvertToInstanceMethod
    "    ConvertToMacLineSeparators
    "    ConvertToUnixLineSeparators
    "    ConvertToWindowsLineSeparators
    "    Copy.Paste.Special
    "    CopyAbsolutePath
    "    CopyAsPlainText
    "    CopyAsRichText
    "    CopyContentRootPath
    "    CopyElement                                        <F5>
    "    CopyExternalReferenceGroup
    "    CopyFileName
    "    CopyFileReference
    "    CopyGroup
    "    CopyKotlinProjectInformation
    "    CopyPathFromRepositoryRootProvider
    "    CopyPaths                                          <M-S-C>
    "    CopyPathWithLineNumber
    "    CopyReference                                      <M-A-S-C>
    "    CopyReferencePopup
    "    CopyReferencePopupGroup
    "    CopySettingsPath
    "    CopySourceRootPath
    "    CopyTBXReference
    "    CopyUrl
    "    Coverage
    "    CoverageMenu
    "    CoveragePlatformMenu
    "    CreateDesktopEntry
    "    CreateEditorConfigFile
    "    CreateLauncherScript
    "    CreateLibraryFromFile
    "    CreateResourceBundle
    "    CreateRunConfiguration
    "    CreateSetupPy
    "    CutCopyPasteGroup
    "    Debug                                              <C-D>
    "    DebugBuildProcess
    "    DebugClass                                         <C-S-D>
    "    Debugger.AddSteppingFilter
    "    Debugger.AddToWatch
    "    Debugger.AdjustArrayRange
    "    Debugger.AsyncStacks
    "    Debugger.AutoRenderer
    "    Debugger.CallTracer
    "    Debugger.CopyStack
    "    Debugger.CreateRenderer
    "    Debugger.CustomizeContextView
    "    Debugger.CustomizeThreadsView
    "    Debugger.EditArrayFilter                           <F2>
    "    Debugger.EditCustomField                           <F2>
    "    Debugger.EditFrameSource                           <M-Down> <F4>
    "    Debugger.EditNodeSource
    "    Debugger.EditTypeSource                            <S-F4>
    "    Debugger.EvaluateInConsole
    "    Debugger.EvaluationDialogPopup
    "    Debugger.FilterArray
    "    Debugger.FocusOnBreakpoint
    "    Debugger.ForceEarlyReturn
    "    Debugger.FramePanelPopup
    "    Debugger.FreezeThread
    "    Debugger.InspectPanelPopup
    "    Debugger.InterruptThread
    "    Debugger.MarkObject                                <F3>
    "    Debugger.MuteRenderers
    "    Debugger.NewCustomField
    "    Debugger.PopFrame
    "    Debugger.ReloadFile
    "    Debugger.RemoveAllBreakpoints
    "    Debugger.RemoveAllBreakpointsInFile
    "    Debugger.RemoveArrayFilter                         <Del> <BS> <M-BS>
    "    Debugger.RemoveCustomField                         <Del> <BS> <M-BS>
    "    Debugger.Representation
    "    Debugger.RestoreBreakpoint
    "    Debugger.ResumeThread
    "    Debugger.ShowLibraryFrames
    "    Debugger.ShowReferring
    "    Debugger.ShowRelatedStack
    "    Debugger.ShowTypes
    "    Debugger.StepOutOfBlock
    "    Debugger.SwitchToTheNextContext
    "    Debugger.ThreadsPanelPopup
    "    Debugger.ThrowException
    "    Debugger.Tree.EvaluateInConsole
    "    Debugger.ViewAsGroup
    "    Debugger.ViewText
    "    Debugger.WatchesPanelPopup
    "    DebuggingActionsGroup
    "    DebugMainMenu
    "    DebugReloadGroup
    "    DecompileKotlinToJava
    "    DecrementWindowHeight                              <M-S-Up>
    "    DecrementWindowWidth                               <M-S-Left>
    "    DelegateMethods

    "    DevkitNewActions
    "    Diff.AppendLeftSide
    "    Diff.AppendRightSide
    "    Diff.ApplyLeftSide                                 <C-S-Right>
    "    Diff.ApplyNonConflicts
    "    Diff.ApplyNonConflicts.Left
    "    Diff.ApplyNonConflicts.Right
    "    Diff.ApplyRightSide                                <C-S-Left>
    "    Diff.ComparePartial.Base.Left
    "    Diff.ComparePartial.Base.Right
    "    Diff.ComparePartial.Left.Right
    "    Diff.CompareWithBase.Left
    "    Diff.CompareWithBase.Result
    "    Diff.CompareWithBase.Right
    "    Diff.EditorGutterPopupMenu
    "    Diff.EditorGutterPopupMenu.EditorSettings
    "    Diff.EditorPopupMenu
    "    Diff.FocusOppositePane                             <C-Tab>
    "    Diff.FocusOppositePaneAndScroll                    <C-S-Tab>
    "    Diff.IgnoreLeftSide
    "    Diff.IgnoreRightSide
    "    Diff.KeymapGroup
    "    Diff.MagicResolveConflicts
    "    Diff.NextChange                                    <M-S-]> <C-Right>
    "    Diff.NextConflict
    "    Diff.PrevChange                                    <M-S-[> <C-Left>
    "    Diff.PreviousConflict
    "    Diff.ResolveConflict
    "    Diff.ShowDiff                                      <M-D>
    "    Diff.ShowInExternalTool
    "    Diff.ShowSettingsPopup                             <M-S-D>
    "    Diff.ViewerPopupMenu
    "    Diff.ViewerToolbar
    "    DirDiffMenu
    "    DirDiffMenu.CancelComparingNewFilesWithEachOther
    "    DirDiffMenu.CompareNewFilesWithEachOtherAction
    "    DirDiffMenu.EnableEqual
    "    DirDiffMenu.EnableLeft
    "    DirDiffMenu.EnableNotEqual
    "    DirDiffMenu.EnableRight
    "    DirDiffMenu.MirrorToLeft
    "    DirDiffMenu.MirrorToRight
    "    DirDiffMenu.SetCopyToLeft
    "    DirDiffMenu.SetCopyToRight
    "    DirDiffMenu.SetDefault
    "    DirDiffMenu.SetDelete
    "    DirDiffMenu.SetNoOperation
    "    DirDiffMenu.SynchronizeDiff                        <CR>
    "    DirDiffMenu.SynchronizeDiff.All                    <M-CR>
    "    DirDiffMenu.WarnOnDeletion
    "    DirDiffOperationsMenu
    "    DisableInspection
    "    DissociateResourceBundleAction
    "    DocCommentGutterIconContextMenu
    "    DockPinnedMode
    "    DockUnpinnedMode
    "    Document2XSD
    "    DomCollectionControl
    "    DomCollectionControl.Add                           <Ins>
    "    DomCollectionControl.Edit                          <M-Down> <F4>
    "    DomCollectionControl.Remove                        <Del> <BS> <M-BS>
    "    DomElementsTreeView.AddElement                     <Ins>
    "    DomElementsTreeView.AddElementGroup
    "    DomElementsTreeView.DeleteElement                  <Del> <BS> <M-BS>
    "    DomElementsTreeView.GotoDomElementDeclarationAction <M-Down> <F4>
    "    DomElementsTreeView.TreePopup
    "    DumpLookupElementWeights                           <M-A-S-W>
    "    DumpMLCompletionFeatures                           <M-A-S-0>
    "    DumpThreads
    "    Dvcs.FileHistory.ContextMenu
    "    Dvcs.Log.ContextMenu
    "    Dvcs.Log.Toolbar
    "    EditBookmark
    "    EditBookmarksGroup
    "    EditBreakpoint                                     <M-S-F8>
    "    EditCreateDeleteGroup
    "    EditCustomProperties
    "    EditCustomVmOptions
    "    EditFavorites
    "    EditInspectionSettings
    "    EditMacros
    "    EditMenu
    "    EditorActions
    "    EditorAddCaretPerSelectedLine                      <A-S-G>
    "    EditorAddOrRemoveCaret                             button=1 clickCount=1 modifiers=576
    "    EditorAddRectangularSelectionOnMouseDrag           button=1 clickCount=1 modifiers=832
    "    EditorBackSpace                                    <BS> <S-BS>
    "    EditorBackwardParagraph
    "    EditorBackwardParagraphWithSelection
    "    EditorBidiTextDirection
    "    EditorBreadcrumbsHideBoth
    "    EditorBreadcrumbsSettings
    "    EditorBreadcrumbsShowAbove
    "    EditorBreadcrumbsShowBelow
    "    EditorChooseLookupItem                             <CR>
    "    EditorChooseLookupItemCompleteStatement            <M-S-CR>
    "    EditorChooseLookupItemDot                          <C-.>
    "    EditorChooseLookupItemReplace                      <Tab>
    "    EditorCloneCaretAbove
    "    EditorCloneCaretBelow
    "    EditorCodeBlockEnd                                 <M-A-]>
    "    EditorCodeBlockEndWithSelection                    <M-A-S-]>
    "    EditorCodeBlockStart                               <M-A-[>
    "    EditorCodeBlockStartWithSelection                  <M-A-S-[>
    "    EditorCompleteStatement                            <M-S-CR>
    "    EditorContextBarMenu
    "    EditorContextInfo                                  <C-S-Q>
    "    EditorCopy                                         <M-C>
    "    EditorCreateRectangularSelection                   button=2 clickCount=1 modifiers=576
    "    EditorCreateRectangularSelectionOnMouseDrag        button=1 clickCount=1 modifiers=512 button=2 clickCount=1 modifiers=0
    "    EditorCut                                          <M-X> <S-Del>
    "    EditorCutLineBackward
    "    EditorCutLineEnd                                   <C-K>
    "    EditorDecreaseFontSize
    "    EditorDelete                                       <Del>
    "    EditorDeleteLine                                   <M-BS>
    "    EditorDeleteToLineEnd
    "    EditorDeleteToLineStart
    "    EditorDeleteToWordEnd                              <A-Del>
    "    EditorDeleteToWordEndInDifferentHumpsMode
    "    EditorDeleteToWordStart                            <A-BS>
    "    EditorDeleteToWordStartInDifferentHumpsMode
    "    EditorDown                                         <Down> <C-N>
    "    EditorDownWithSelection                            <S-Down>
    "    EditorDuplicate                                    <M-D>
    "    EditorDuplicateLines
    "    EditorEnter                                        <CR>
    "    EditorEscape                                       <Esc>
    "    EditorFocusGutter                                  <A-S-6>
    "    EditorForwardParagraph
    "    EditorForwardParagraphWithSelection
    "    EditorGutterPopupMenu
    "    EditorGutterToggleGlobalIndentLines
    "    EditorGutterToggleGlobalLineNumbers
    "    EditorGutterVcsPopupMenu
    "    EditorHungryBackSpace
    "    EditorIncreaseFontSize
    "    EditorIndentLineOrSelection
    "    EditorIndentSelection                              <Tab>
    "    EditorJoinLines                                    <C-S-J>
    "    EditorKillRegion
    "    EditorKillRingSave
    "    EditorKillToWordEnd
    "    EditorKillToWordStart
    "    EditorLangPopupMenu
    "    EditorLeft                                         <Left> <C-B>
    "    EditorLeftWithSelection                            <S-Left>
    "    EditorLineEnd                                      <End> <M-Right> <C-E>
    "    EditorLineEndWithSelection                         <S-End> <M-S-Right>
    "    EditorLineStart                                    <Home> <M-Left> <C-A>
    "    EditorLineStartWithSelection                       <S-Home> <M-S-Left>
    "    EditorLookupDown                                   <C-Down>
    "    EditorLookupUp                                     <C-Up>
    "    EditorMatchBrace                                   <C-M>
    "    EditorMoveDownAndScroll
    "    EditorMoveDownAndScrollWithSelection
    "    EditorMoveToPageBottom                             <M-Pagedown>
    "    EditorMoveToPageBottomWithSelection                <M-S-Pagedown>
    "    EditorMoveToPageTop                                <M-Pageup>
    "    EditorMoveToPageTopWithSelection                   <M-S-Pageup>
    "    EditorMoveUpAndScroll
    "    EditorMoveUpAndScrollWithSelection
    "    EditorNextWord                                     <A-Right>
    "    EditorNextWordInDifferentHumpsMode
    "    EditorNextWordInDifferentHumpsModeWithSelection
    "    EditorNextWordWithSelection                        <A-S-Right>
    "    EditorPageDown                                     <Pagedown>
    "    EditorPageDownWithSelection                        <S-Pagedown>
    "    EditorPageUp                                       <Pageup>
    "    EditorPageUpWithSelection                          <S-Pageup>
    "    EditorPaste                                        <M-V>
    "    EditorPasteFromX11                                 button=2 clickCount=1 modifiers=0
    "    EditorPasteSimple                                  <M-A-S-V>
    "    EditorPopupMenu
    "    EditorPopupMenu.GoTo
    "    EditorPopupMenu.Run
    "    EditorPopupMenu1
    "    EditorPopupMenu1.FindRefactor
    "    EditorPopupMenu2
    "    EditorPopupMenu3
    "    EditorPopupMenuDebug
    "    EditorPopupMenuDebugJava
    "    EditorPreviousWord                                 <A-Left>
    "    EditorPreviousWordInDifferentHumpsMode
    "    EditorPreviousWordInDifferentHumpsModeWithSelection
    "    EditorPreviousWordWithSelection                    <A-S-Left>
    "    EditorResetFontSize
    "    EditorReverseLines
    "    EditorRight                                        <Right> <C-F>
    "    EditorRightWithSelection                           <S-Right>
    "    EditorScrollBottom
    "    EditorScrollDown
    "    EditorScrollDownAndMove
    "    EditorScrollLeft
    "    EditorScrollRight
    "    EditorScrollToCenter
    "    EditorScrollTop
    "    EditorScrollUp
    "    EditorScrollUpAndMove
    "    EditorSelectLine
    "    EditorSelectWord                                   <A-Up>
    "    EditorSetContentBasedBidiTextDirection
    "    EditorSetLtrBidiTextDirection
    "    EditorSetRtlBidiTextDirection
    "    EditorShowGutterIconTooltip                        <A-S-6>
    "    EditorSortLines
    "    EditorSplitLine                                    <M-CR>
    "    EditorStartNewLine                                 <S-CR>
    "    EditorStartNewLineBefore                           <M-A-CR>
    "    EditorSwapSelectionBoundaries
    "    EditorTab                                          <Tab>
    "    EditorTabActionGroup
    "    EditorTabCompileGroup
    "    EditorTabPopupMenu
    "    EditorTabPopupMenuEx
    "    EditorTabsGroup
    "    EditorTextEnd                                      <M-End>
    "    EditorTextEndWithSelection                         <M-S-End>
    "    EditorTextStart                                    <M-Home>
    "    EditorTextStartWithSelection                       <M-S-Home>
    "    EditorToggleActions
    "    EditorToggleCase                                   <M-S-U>
    "    EditorToggleColumnMode                             <M-S-8>
    "    EditorToggleInsertState
    "    EditorToggleShowBreadcrumbs
    "    EditorToggleShowGutterIcons
    "    EditorToggleShowIndentLines
    "    EditorToggleShowLineNumbers
    "    EditorToggleShowWhitespaces
    "    EditorToggleStickySelection
    "    EditorToggleUseSoftWraps
    "    EditorToggleUseSoftWrapsInPreview
    "    EditorUnindentSelection                            <S-Tab>
    "    EditorUnSelectWord                                 <A-Down>
    "    EditorUp                                           <Up> <C-P>
    "    EditorUpWithSelection                              <S-Up>
    "    EditPropertyValue                                  <A-F6>
    "    editRunConfigurations
    "    EditSelectGroup
    "    EditSelectWordGroup
    "    EditSmartGroup
    "    EditSource                                         <M-Down> <F4>
    "    EditSourceInNewWindow                              <S-F4>
    "    EmacsStyleIndent
    "    Emmet
    "    EmmetNextEditPoint                                 <A-C-Right>
    "    EmmetPreview
    "    EmmetPreviousEditPoint                             <A-C-Left>
    "    EmmetUpdateTag
    "    EmojiAndSymbols                                    <M-C- >
    "    EncapsulateFields
    "    EscapeEntities
    "    EvaluateExpression                                 <A-F8>
    "    ExcludeFromStubGeneration
    "    ExcludeFromValidation
    "    ExecuteInPyConsoleAction                           <A-S-E> <C-S-E>
    "    Exit                                               <M-Q>
    "    ExpandAll                                          <M-k> <M-=>
    "    ExpandAllRegions                                   <M-S-k> <M-S-=>
    "    ExpandAllToLevel
    "    ExpandAllToLevel1                                  <M-A-j> <M-A-j>
    "    ExpandAllToLevel2                                  <M-A-j> <M-A-j>
    "    ExpandAllToLevel3                                  <M-A-j> <M-A-j>
    "    ExpandAllToLevel4                                  <M-A-j> <M-A-j>
    "    ExpandAllToLevel5                                  <M-A-j> <M-A-j>
    "    ExpandDocComments
    "    ExpandExpandableComponent                          <S-CR> <M-k> <M-=>
    "    ExpandLiveTemplateByTab                            <Tab>
    "    ExpandLiveTemplateCustom
    "    ExpandRegion                                       <M-k> <M-=>
    "    ExpandRegionRecursively                            <M-A-k> <M-A-=>
    "    ExpandToLevel
    "    ExpandToLevel1                                     <M-j> <M-j>
    "    ExpandToLevel2                                     <M-j> <M-j>
    "    ExpandToLevel3                                     <M-j> <M-j>
    "    ExpandToLevel4                                     <M-j> <M-j>
    "    ExpandToLevel5                                     <M-j> <M-j>
    "    ExpandTreeNode                                     <k>
    "    ExplicitArgumentMenu.ShowImplicitArgumentsPopup
    "    ExplicitArgumentsMenu
    "    ExportImportGroup
    "    ExportSettings
    "    ExportTestResults
    "    ExportThreads
    "    ExportToEclipse
    "    ExportToHTML
    "    ExportToTextFile                                   <C-O>
    "    ExpressionTypeInfo                                 <C-S-P>
    "    ExternalJavaDoc                                    <S-F1>
    "    ExternalSystem.Actions
    "    ExternalSystem.AfterCompile
    "    ExternalSystem.AfterRebuild
    "    ExternalSystem.AfterSync
    "    ExternalSystem.AssignRunConfigurationShortcut
    "    ExternalSystem.AssignShortcut
    "    ExternalSystem.AttachProject
    "    ExternalSystem.BeforeCompile
    "    ExternalSystem.BeforeRebuild
    "    ExternalSystem.BeforeRun
    "    ExternalSystem.BeforeSync
    "    ExternalSystem.CollapseAll                         <M-m> <M-->
    "    ExternalSystem.CreateRunConfiguration
    "    ExternalSystem.DetachProject                       <Del> <BS> <M-BS>
    "    ExternalSystem.EditRunConfiguration
    "    ExternalSystem.ExpandAll                           <M-k> <M-=>
    "    ExternalSystem.GroupModules
    "    ExternalSystem.GroupTasks
    "    ExternalSystem.HideProjectRefreshAction
    "    ExternalSystem.IgnoreProject
    "    ExternalSystem.OpenConfig                          <M-Down> <F4>
    "    ExternalSystem.OpenTasksActivationManager
    "    ExternalSystem.ProjectRefreshAction                <M-S-I>
    "    ExternalSystem.ProjectRefreshActionGroup
    "    ExternalSystem.RefreshAllProjects
    "    ExternalSystem.RefreshProject
    "    ExternalSystem.RemoveRunConfiguration
    "    ExternalSystem.RunTask
    "    ExternalSystem.SelectProjectDataToImport
    "    ExternalSystem.ShowCommonSettings
    "    ExternalSystem.ShowIgnored
    "    ExternalSystem.ShowInheritedTasks
    "    ExternalSystem.ShowSettings
    "    ExternalSystem.ShowSettingsGroup
    "    ExternalSystem.ToggleAutoReload
    "    ExternalSystem.ToggleAutoReload.All
    "    ExternalSystem.ToggleAutoReload.None
    "    ExternalSystem.ToggleAutoReload.Selective
    "    ExternalSystemView.ActionsToolbar
    "    ExternalSystemView.ActionsToolbar.CenterPanel
    "    ExternalSystemView.ActionsToolbar.LeftPanel
    "    ExternalSystemView.ActionsToolbar.RightPanel
    "    ExternalSystemView.BaseProjectMenu
    "    ExternalSystemView.ModuleMenu
    "    ExternalSystemView.ProjectMenu
    "    ExternalSystemView.RunConfigurationMenu
    "    ExternalSystemView.TaskActivationGroup
    "    ExternalSystemView.TaskMenu
    "    ExternalToolsGroup
    "    ExtractClass
    "    ExtractFunction                                    <M-A-M>
    "    ExtractFunctionToScope                             <M-A-S-M>
    "    ExtractInclude
    "    ExtractInterface
    "    ExtractMethod                                      <M-A-M>
    "    ExtractMethodToolWindow.TreePopup
    "    ExtractModule
    "    ExtractSuperclass
    "    FavoritesViewPopupMenu
    "    FileChooser
    "    FileChooser.Delete                                 <Del> <BS> <M-BS>
    "    FileChooser.GotoDesktop                            <M-D>
    nnoremap <LEADER>n   :action FileChooser.GotoHome<cr>
    "    FileChooser.GotoJDK
    "    FileChooser.GotoModule                             <M-3>
    "    FileChooser.GotoProject                            <M-2>
    "    FileChooser.LightEditGotoOpenedFile
    "    FileChooser.NewFile
    "    FileChooser.NewFolder                              <M-N>
    "    FileChooser.Refresh                                <M-A-Y>
    "    FileChooser.ShowHiddens
    "    FileChooser.TogglePathShowing                      <M-P>
    "    FileChooserToolbar
    "    FileExportGroup
    "    FileHistory.AnnotateRevision
    "    FileHistory.KeymapGroup
    "    FileMainSettingsGroup
    "    FileMenu
    "    FileOpenGroup
    "    FileOtherSettingsGroup
    "    FilePropertiesGroup
    "    FileSettingsGroup
    "    FileStructurePopup                                 <M-F12>
    "    FileTemplateSeparatorGroup
    "    FillParagraph
    "    Find                                               <M-F>
    "    FindInPath                                         <M-S-F>
    "    FindMenuGroup
    "    FindModal
    "    FindNext                                           <M-G>
    "    FindPrevious                                       <M-S-G>
    "    FindUsages                                         <A-F7>
    "    FindUsagesInFile                                   <M-F7>
    "    FindUsagesMenuGroup
    "    FindWordAtCaret
    "    FixDocComment
    "    FloatMode
    "    FocusEditor                                        <Esc>
    "    FoldingGroup
    "    ForceRefresh                                       <M-A-S-R>
    "    ForceRunToCursor                                   <M-A-F9>
    "    ForceStepInto                                      <A-S-F7>
    "    ForceStepOver                                      <A-S-F8>
    "    Forward                                            <M-]> <M-A-Right> button=5 clickCount=1 modifiers=0
    "    FullyExpandTreeNode                                <j>
    "    Gant.NewScript
    "    Generate                                           <M-N> <C-CR>
    "    GenerateAfterClassMethod
    "    GenerateBeforeClassMethod
    "    GenerateConstructor
    "    GenerateCopyright
    "    GenerateCoverageReport
    "    GenerateCreateUI
    "    GenerateDataMethod
    "    GenerateDTD
    "    GenerateEquals
    "    GenerateExternalization
    "    GenerateFromTestCreatorsGroup
    "    GenerateGetter
    "    GenerateGetterAndSetter
    "    GenerateGradleDslGroup
    "    GenerateGroup
    "    GenerateJavadoc
    "    GenerateModuleDescriptors
    "    GeneratePattern
    "    GenerateSetter
    "    GenerateSetUpMethod
    "    GenerateSuperMethodCall
    "    GenerateTearDownMethod
    "    GenerateTestMethod
    "    GenerateXmlTag
    "    Generify
    "    GotoAction                                         <M-S-A>
    "    GotoBookmark0                                      <C-0>
    "    GotoBookmark1                                      <C-1>
    "    GotoBookmark2                                      <C-2>
    "    GotoBookmark3                                      <C-3>
    "    GotoBookmark4                                      <C-4>
    "    GotoBookmark5                                      <C-5>
    "    GotoBookmark6                                      <C-6>
    "    GotoBookmark7                                      <C-7>
    "    GotoBookmark8                                      <C-8>
    "    GotoBookmark9                                      <C-9>
    "    GotoChangedFile                                    <M-O>
    "    GoToChangeMarkerGroup
    "    GotoClass                                          <M-O>
    "    GoToCodeGroup
    "    GotoCustomRegion                                   <M-A-.>
    "    GotoDeclaration                                    <M-B> button=1 clickCount=1 modifiers=256 Force touch button=2 clickCount=1 modifiers=0
    "    GotoDeclarationOnly
    "    GoToEditPointGroup
    "    GoToErrorGroup
    "    GotoFile                                           <M-S-O>
    "    GotoImplementation                                 <M-A-B> button=1 clickCount=1 modifiers=768
    "    GoToLastTab
    "    GotoLine                                           <M-L>
    "    GoToLinkTarget
    "    GoToMenu
    "    GotoNextBookmark
    "    GotoNextElementUnderCaretUsage                     <A-C-Down>
    "    GotoNextError                                      <F2>
    "    GotoNextIncompletePropertyAction                   <F2>
    "    GotoPrevElementUnderCaretUsage                     <A-C-Up>
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
    "    GoToTargetEx
    "    GotoTest                                           <M-S-T>
    "    GotoTypeDeclaration                                <M-CR>
    "    GroovyGenerateGroup1
    "    GuiDesigner.AddComponent
    "    GuiDesigner.AddGroup
    "    GuiDesigner.AddTab
    "    GuiDesigner.ChooseLocale
    "    GuiDesigner.ComponentTreePopupMenu
    "    GuiDesigner.CreateComponent                        <M-N> <C-CR>
    "    GuiDesigner.CreateListener                         <C-O>
    "    GuiDesigner.DataBindingWizard
    "    GuiDesigner.DecreaseIndent                         <S-Tab>
    "    GuiDesigner.DeleteComponent                        <Del> <BS> <M-BS>
    "    GuiDesigner.DeleteGroup                            <Del> <BS> <M-BS>
    "    GuiDesigner.Duplicate                              <M-D>
    "    GuiDesigner.EditComponent                          <F2>
    "    GuiDesigner.EditGroup                              <F2>
    "    GuiDesigner.EditorPopupMenu
    "    GuiDesigner.ExpandSelection                        <A-Up>
    "    GuiDesigner.Flatten
    "    GuiDesigner.FormSource
    "    GuiDesigner.GenerateMain
    "    GuiDesigner.GoToListener                           <M-A-B> button=1 clickCount=1 modifiers=768
    "    GuiDesigner.GroupButtons
    "    GuiDesigner.IncreaseIndent                         <Tab>
    "    GuiDesigner.MainToolbarActions
    "    GuiDesigner.Morph
    "    GuiDesigner.NewActions
    "    GuiDesigner.Pack
    "    GuiDesigner.PaletteComponentPopupMenu
    "    GuiDesigner.PaletteGroupPopupMenu
    "    GuiDesigner.PreviewForm
    "    GuiDesigner.PropertyInspectorPopupMenu
    "    GuiDesigner.QuickJavadoc                           <F1> <C-J> button=2 clickCount=1 modifiers=128
    "    GuiDesigner.ReloadCustomComponents
    "    GuiDesigner.ResetValue
    "    GuiDesigner.ShowComponentTags
    "    GuiDesigner.ShowGrid
    "    GuiDesigner.ShrinkSelection                        <A-Down>
    "    GuiDesigner.SurroundPopup                          <M-A-T>
    "    GuiDesigner.UngroupButtons
    "    GutterMenuBookmarks
    "    Help.JetBrainsTV
    "    Help.KeymapReference
    "    HelpDiagnosticTools
    "    HelpMenu
    "    HelpTopics
    "
    nnoremap <LEADER>b    :action HideActiveWindow<cr>
    "    HideAllWindows                                     <M-S-F12>
    "    HideCoverage
    "    HideSideWindows
    "    HidpiInfo
    "    HierarchyGroup
    "    HighlightUsagesInFile                              <M-S-F7>
    "    HippieBackwardCompletion                           <A-S-/>
    "    HippieCompletion                                   <A-/>
    "    Hotswap
    "    I18nize
    "    idea.java.decompiler.action.group
    "    IdeaVim.ReloadVimRc.group
    "  还是使用shift-esc比较好用
    " nnoremap <LEADER>sc   <ESC>:action IdeaVim.ReloadVimRc.reload<cr>
    "    IdeScriptingConsole
    "    Images.ChangeBackground
    "    Images.ConvertSvgToPng
    "    Images.EditExternally                              <M-A-F4>
    "    Images.Editor.ActualSize                           <M-o> <M-/>
    "    Images.Editor.FitZoomToWindow
    "    Images.Editor.ToggleGrid                           <M-Þ>
    "    Images.Editor.ZoomIn                               <M-k> <M-=>
    "    Images.Editor.ZoomOut                              <M-m> <M-->
    "    Images.EditorPopupMenu
    "    Images.EditorToolbar
    "    Images.SetBackgroundImage
    "    Images.ShowBorder
    "    Images.ShowThumbnails
    "    Images.Thumbnails.EnterAction                      <CR>
    "    Images.Thumbnails.Hide                             <M-W>
    "    Images.Thumbnails.ToggleFileName
    "    Images.Thumbnails.ToggleFileSize
    "    Images.Thumbnails.ToggleRecursive                  <A-j>
    "    Images.Thumbnails.ToggleTagsPanelName
    "    Images.Thumbnails.UpFolder                         <BS>
    "    Images.ThumbnailsPopupMenu
    "    Images.ThumbnailsToolbar
    "    Images.ToggleTransparencyChessboard
    "    ImagesRootGroup
    "    ImplementMethods                                   <C-I>
    "    ImplicitArgumentsMenu
    "    ImplicitConversionMenu
    "    ImportModule
    "    ImportModuleFromImlFile
    "    ImportProject
    "    ImportSettings
    "    ImportTests
    "    ImportTestsFromFile
    "    IncomingChanges.Refresh
    "    IncomingChangesToolbar
    "    IncrementalSearch
    "    IncrementWindowHeight                              <M-S-Down>
    "    IncrementWindowWidth                               <M-S-Right>
    "    InferNullity
    "    InheritanceToDelegation
    "    Inline                                             <M-A-N>
    "    InsertLiveTemplate                                 <M-J>
    "    InspectCode
    "    InspectCodeActionInPopupMenus
    "    InspectCodeGroup
    "    InspectCodeInCodeMenuGroup
    "    InspectionToolWindow.TreePopup
    "    IntegrateFiles
    "    IntroduceActionsGroup
    "    IntroduceConstant                                  <M-A-C>
    "    IntroduceField                                     <M-A-F>
    "    IntroduceFunctionalParameter                       <M-A-S-P>
    "    IntroduceFunctionalVariable
    "    IntroduceParameter                                 <M-A-P>
    "    IntroduceParameterObject
    "    IntroduceProperty                                  <M-A-F>
    "    IntroduceTypeAlias                                 <M-A-S-A>
    "    IntroduceTypeParameter
    "    IntroduceVariable                                  <M-A-V>
    "    InvalidateCaches
    "    InvertBoolean
    "    Java.BuildMenu
    "    JavaCompileGroup
    "    JavaDebuggerActions
    "    JavaGenerateGroup1
    "    JavaGenerateGroup2
    "    JavaMethodHierarchyPopupMenu
    "    JavaNewProjectOrModuleGroup
    "    JShell.Console
    "    JsonCopyPointer
    "    JumpToColorsAndFonts
    "    JumpToLastChange                                   <M-S-BS>
    "    JumpToLastWindow                                   <F12>
    "    JumpToNextChange

    "    LangCodeInsightActions
    "    LanguageSpecificFoldingGroup
    "    LightEditModePopup
    "    LightEditOpenFileInProject
    "    List-scrollDown                                    <Pagedown>
    "    List-scrollDownExtendSelection                     <S-Pagedown>
    "    List-scrollUp                                      <Pageup>
    "    List-scrollUpExtendSelection                       <S-Pageup>
    "    List-selectFirstRow                                <M-Home>
    "    List-selectFirstRowExtendSelection                 <M-S-Home>
    "    List-selectLastRow                                 <M-End>
    "    List-selectLastRowExtendSelection                  <M-S-End>
    "    List-selectNextColumn                              <Right> <C-F>
    "    List-selectNextColumnExtendSelection               <S-Right>
    "    List-selectNextRow                                 <Down> <C-N>
    "    List-selectNextRowExtendSelection                  <S-Down>
    "    List-selectPreviousColumn                          <Left> <C-B>
    "    List-selectPreviousColumnExtendSelection           <S-Left>
    "    List-selectPreviousRow                             <Up> <C-P>
    "    List-selectPreviousRowExtendSelection              <S-Up>
    "    ListActions
    "    LoadConfigurationAction
    "    LoadUnloadModules
    "    LocalHistory
    "    LocalHistory.PutLabel
    "    LocalHistory.ShowHistory
    "    LocalHistory.ShowSelectionHistory
    "    Log.FileHistory.KeymapGroup
    "    Log.KeymapGroup
    "    LogDebugConfigure
    "    LookupActions
    "    Macros
    "    MacrosGroup
    "    MainMenu
    "    MaintenanceAction                                  <M-A-S-/>
    "    MaintenanceGroup
    "    MainToolBar
    "    MainToolBarSettings
    "    MakeAllJarsAction
    "    MakeExplicit
    "    MakeJarAction
    "    MakeModule
    "    MakeStatic
    "    ManageProjectTemplates
    "    ManageRecentProjects
    "    ManageTargets
    "    MarkAsContentRoot
    "    MarkAsOriginalTypeAction
    "    MarkAsPlainTextAction
    "    Markdown.Toolbar.Left
    "    Markdown.Toolbar.Right
    "    MarkExcludeRoot
    "    MarkFileAs
    "    MarkGeneratedSourceRoot
    "    MarkGeneratedSourceRootGroup
    "    MarkNotificationsAsRead
    "    MarkRootGroup
    "    MarkSourceRootGroup
    "

    "    MaximizeActiveDialog
    "    MaximizeToolWindow                                 <M-S-Þ>
    "    MemberPushDown
    "    MembersPullUp
    "    Memory.CalculateRetainedSize
    "    MemoryView.ClassesPopupActionGroup
    "    MemoryView.EnableTrackingWithClosedWindow
    "    MemoryView.JumpToTypeSource
    "    MemoryView.SettingsPopupActionGroup
    "    MemoryView.ShowAllocationStackTrace
    "    MemoryView.ShowInstances
    "    MemoryView.ShowInstancesFromDebuggerTree
    "    MemoryView.ShowNewInstances
    "    MemoryView.ShowOnlyTracked
    "    MemoryView.ShowOnlyWithDiff
    "    MemoryView.ShowOnlyWithInstances
    "    MemoryView.SwitchUpdateMode
    "    MemoryView.TrackingAction.NewInstancesTracking
    "    MergeSettings
    "    MethodDown                                         <C-Down>
    "    MethodDuplicates
    "    MethodHierarchy                                    <M-S-H>
    "    MethodHierarchy.BaseOnThisMethod                   <M-S-H>
    "    MethodHierarchy.ImplementMethodAction              <C-I>
    "    MethodHierarchy.OverrideMethodAction               <C-O>
    "    MethodHierarchyPopupMenu
    "    MethodOverloadSwitchDown                           <A-Down>
    "    MethodOverloadSwitchUp                             <A-Up>
    "    MethodUp                                           <C-Up>
    "    Migrate
    "    MinimizeCurrentWindow                              <M-M>
    "    ModuleSettings
    "    Move                                               <F6>
    "    MoveEditorToOppositeTabGroup
    "    MoveElementLeft                                    <M-A-S-Left>
    "    MoveElementRight                                   <M-A-S-Right>
    "    MoveLineDown                                       <A-S-Down>
    "    MoveLineUp                                         <A-S-Up>
    "    MoveModuleToGroup
    "    MoveStatementDown                                  <M-S-Down>
    "    MoveStatementUp                                    <M-S-Up>
    "    MoveTabDown
    "    MoveTabRight
    "    Mvc.Actions
    "    Mvc.RunTarget                                      <M-A-G>
    "    Mvc.Upgrade
    "    NavBar-cancel                                      <Esc>
    "    NavBar-navigate                                    <M-Down> <F4>
    "    NavBar-return                                      <CR>
    "    NavBar-selectDown                                  <Down> <C-N>
    "    NavBar-selectEnd                                   <End> <M-Right> <C-E>
    "    NavBar-selectHome                                  <Home> <M-Left> <C-A>
    "    NavBar-selectLeft                                  <Left> <C-B>
    "    NavBar-selectRight                                 <Right> <C-F>
    "    NavBar-selectUp                                    <Up> <C-P>
    "    NavBarActions
    "    NavbarPopupMenu
    "    NavBarToolBar
    "    NavBarToolBarOthers
    "    NavBarVcsGroup
    "    NavigateInFileGroup
    "    NewAction
    "    NewApplicationService
    "    NewClass
    "    NewDialog
    "    NewDir
    "    NewEditorConfigFile
    "    NewElement                                         <M-N> <C-CR>
    "    NewElementInMenuGroup
    "    NewElementSamePlace                                <A-C-N>
    "    NewFile
    "    NewForm
    "    NewFormSnapshot
    "    NewFromTemplate
    "    NewFxmlFile
    "    NewGroup
    "    NewGroup1
    "    NewHtmlFile
    "    NewJavaSpecialFile
    "    NewModule
    "    NewModuleInfo
    "    NewModuleInGroup
    "    NewModuleService
    "    NewPackageInfo
    "    NewProject
    "    NewProjectOrModuleGroup
    "    NewProjectService
    "    NewPropertyAction
    "    NewPythonFile
    "    NewPythonPackage
    "    NewScratchBuffer
    "    NewScratchFile                                     <M-S-N>
    "    NewXml
    "    NewXmlDescriptor
    "    NextDiff                                           <F7>
    "    NextEditorTab                                      <C-S-Right>
    "    NextOccurence                                      <M-A-Down>
    "    NextParameter                                      <Tab>
    "    NextProjectWindow                                  <M-A-À>
    "    NextSplitter                                       <A-Tab>
    nnoremap <LEADER>-    :action NextTab<cr>
    "    NextTemplateParameter                              <Tab>
    "    NextTemplateVariable                               <Tab> <CR>
    "    NextWindow                                         <M-À>
    "    Notifications
    "    OnlineDocAction
    "    openAssertEqualsDiff                               <M-D>
    "    OpenBlankEditorInBlankDiffWindow
    "    OpenEditorInOppositeTabGroup
    "    OpenElementInNewWindow                             <S-CR>
    "    OpenFile
    "    OpenFileEditorInBlankDiffWindow
    "    OpenInBrowser
    "    OpenInBrowserEditorContextBarGroupAction
    "    OpenInBrowserGroup
    "    OpenInSceneBuilder
    "    OpenModuleSettings                                 <M-Down> <F4>
    "    OpenMouseWheelSmoothScrollSettings
    "    OpenProjectGroup
    "    OpenProjectWindows
    "    OptimizeImports                                    <A-C-O>

    "    Other.KeymapGroup
    "    OtherMenu
    "    OverrideMethods                                    <C-O>
    "    PackageFile                                        <M-S-F9>
    "    PairFileActions
    "    ParameterInfo                                      <M-P>
    "    ParameterNameHints
    "    PasteGroup
    "    PasteMultiple                                      <M-S-V>
    "    Pause
    "    PauseOutput
    "    Performance.ActivityMonitor
    "    performancePlugin.ShowMemoryDialogAction
    "    PinActiveEditorTab
    "    PinActiveTab
    "    PinToolwindowTab
    "    PlaybackLastMacro
    "    PlaySavedMacrosAction
    "    plugin.InstallFromDiskAction
    "    PluginDeployActions
    "    popup@BookmarkContextMenu
    "    PopupHector                                        <M-A-S-H>
    "    PopupMenu-cancel                                   <Esc>
    "    PopupMenu-return                                   <CR>
    "    PopupMenu-selectChild                              <Right> <C-F>
    "    PopupMenu-selectNext                               <Down> <C-N>
    "    PopupMenu-selectParent                             <Left> <C-B>
    "    PopupMenu-selectPrevious                           <Up> <C-P>
    "    PopupMenuActions
    "    PowerSaveGroup
    "    PreviousDiff                                       <S-F7>
    "    PreviousEditorTab                                  <C-S-Left>
    "    PreviousOccurence                                  <M-A-Up>
    "    PreviousProjectWindow                              <M-A-S-À>
    nnoremap <LEADER>=   :action PreviousTab<cr>
    "    PreviousTemplateVariable                           <S-Tab>
    "    PreviousWindow                                     <M-S-À>
    "    PrevParameter                                      <S-Tab>
    "    PrevSplitter                                       <A-S-Tab>
    "    PrevTemplateParameter                              <S-Tab>
    "    Print
    "    PrintExportGroup
    "    ProblemsView.AutoscrollToSource
    "    ProblemsView.CollapseAll                           <M-m> <M-->
    "    ProblemsView.CopyProblemDescription                <M-C>
    "    ProblemsView.ExpandAll                             <M-k> <M-=>
    "    ProblemsView.Options
    "    ProblemsView.QuickFixes                            <A-CR>
    "    ProblemsView.SeverityFilters
    "    ProblemsView.ShowPreview
    "    ProblemsView.SortByName
    "    ProblemsView.SortBySeverity
    "    ProblemsView.SortFoldersFirst
    "    ProblemsView.ToolWindow.SecondaryActions
    "    ProblemsView.ToolWindow.Toolbar
    "    ProblemsView.ToolWindow.TreePopup
    "    ProductivityGuide
    "    ProjectFromVersionControl
    "    ProjectView.AbbreviatePackageNames
    "    ProjectView.AutoscrollFromSource
    "    ProjectView.AutoscrollToSource
    "    ProjectView.CompactDirectories
    "    ProjectView.FlattenModules
    "    ProjectView.FlattenPackages
    "    ProjectView.FoldersAlwaysOnTop
    "    ProjectView.HideEmptyMiddlePackages
    "    ProjectView.ManualOrder
    "    ProjectView.ShowExcludedFiles
    "    ProjectView.ShowLibraryContents
    "    ProjectView.ShowMembers
    "    ProjectView.ShowModules
    "    ProjectView.ShowVisibilityIcons
    "    ProjectView.SortByType
    "    ProjectView.ToolWindow.SecondaryActions
    "    ProjectViewAnalysisGroup
    "    ProjectViewChangeView                              <A-F1>
    "    ProjectViewCompileGroup
    "    ProjectViewEditSource                              <M-Down> <F4>
    "    ProjectViewPopupMenu
    "    ProjectViewPopupMenuModifyGroup
    "    ProjectViewPopupMenuRefactoringGroup
    "    ProjectViewPopupMenuRunGroup
    "    ProjectViewPopupMenuSettingsGroup
    "    PsiViewer
    "    PsiViewerForContext
    "    PyConsoleRenameAction
    "    PyConvertModuleToPackage
    "    PyConvertPackageToModuleAction
    "    PyDebugger.ViewArray
    "    PyDebugger.ViewAsGroup
    "    PyManagePackages
    "    PyPackagingMenu
    "    PyRunFileInConsole
    "    PySyncPythonRequirements
    "    QuickActionPopup                                   <M-A-CR>
    "    QuickActions
    "    QuickChangeScheme                                  <C-À>
    "    QuickDocCopy                                       <M-C>
    "    QuickEvaluateExpression                            <M-A-F8> button=1 clickCount=1 modifiers=512
    "    QuickFixes
    "    QuickImplementations                               <A- > <M-Y>
    "    QuickJavaDoc                                       <F1> <C-J> button=2 clickCount=1 modifiers=128
    "    QuickTypeDefinition
    "    RearrangeCode
    "    RecentChangedFiles
    "    RecentChanges                                      <A-S-C>
    "    RecentFiles                                        <M-E>
    "    RecentLocations                                    <M-S-E>
    "    RecentProjectListGroup
    "    refactoring.extract.dependency                     <M-A-M>
    "    refactoring.introduce.property                     <M-A-V>
    "    RefactoringMenu
    "    RefactoringMenu1
    "    RefactoringMenu2
    "    RefactoringMenu4
    "    RefactoringMenuRenameFile
    "    Refactorings.QuickListPopupAction                  <C-T>
    nnoremap <LEADER>r    :action ReformatCode<cr>
    "    Refresh                                            <M-R>
    "    RegisterPlugins
    "    RemoteServers.AddCloudConnectionGroup
    "    RemoteServers.ChooseServerDeployment
    "    RemoteServers.ChooseServerDeploymentWithDebug
    "    RemoteServers.ConnectServer
    "    RemoteServers.DisconnectServer
    "    RemoteServers.EditDeploymentConfig
    "    RemoteServers.EditServerConfig                     <S-F4>
    "    RemoteServersViewPopup
    "    RemoteServersViewToolbar
    "    RemoteServersViewToolbar.Top
    "    RemoveBom
    "    RemoveBom.Group
    "    RemoveExplicitArguments
    "    RemoveMiddleman
    "    RenameElement                                      <S-F6>
    "    RenameFile
    "    ReopenClosedTab
    "    Replace                                            <M-R>
    "    ReplaceConstructorWithBuilder
    "    ReplaceConstructorWithFactory
    "    ReplaceInPath                                      <M-S-R>
    "    ReplaceMethodWithMethodObject
    "    ReplaceTempWithQuery
    "    ReportProblem
    "    RepositoryChangesBrowserToolbar
    "    Rerun                                              <M-R>
    "    RerunFailedTests
    "    RerunTests                                         <M-C-R> <A-S-R>
    "    ResetToMySettings
    "    ResetToTheirsSettings
    "    ResizeToolWindowDown                               <M-S-Down>
    "    ResizeToolWindowGroup
    "    ResizeToolWindowLeft                               <M-S-Left>
    "    ResizeToolWindowRight                              <M-S-Right>
    "    ResizeToolWindowUp                                 <M-S-Up>
    "    ResourceBundleEditorShowIntentions                 <A-CR>
    "    RestoreDefaultExtensionScripts
    "    RestoreDefaultLayout                               <S-F12>
    "    RestoreDefaultSettings
    "    RestoreFontPreviewTextAction
    "    Resume                                             <M-A-R> <F9>
    "    RevealGroup
    "    RevealIn
    "    Run                                                <C-R>
    "    RunAnything
    "    RunClass                                           <C-S-R>
    "    RunConfiguration
    "    RunConfigurationTemplatesForNewProjects
    "    RunContextGroup
    "    RunContextGroupInner
    "    RunContextPopupGroup
    "    RunCoverage
    "    RunDashboard.AddType
    "    RunDashboard.ClearContent
    "    RunDashboard.CopyConfiguration                     <M-D>
    "    RunDashboard.Debug                                 <C-S-D>
    "    RunDashboard.EditConfiguration                     <S-F4>
    "    RunDashboard.Filter
    "    RunDashboard.GroupBy
    "    RunDashboard.GroupByStatus
    "    RunDashboard.GroupByType
    "    RunDashboard.GroupConfigurations
    "    RunDashboard.HideConfiguration
    "    RunDashboard.RemoveType
    "    RunDashboard.RestoreConfiguration
    "    RunDashboard.RestoreHiddenConfigurations
    "    RunDashboard.Run                                   <C-S-R>
    "    RunDashboard.Stop                                  <M-F2>
    "    RunDashboard.UngroupConfigurations                 <Del> <BS> <M-BS>
    "    RunDashboardContentToolbar
    "    RunDashboardPopup
    "    RunInspection                                      <M-A-S-I>
    "    RunInspectionOn
    "    RunMenu
    "    Runner.CloseAllUnpinnedViews
    "    Runner.CloseAllViews
    "    Runner.CloseOtherViews
    "    Runner.CloseView
    "    Runner.Focus
    "    Runner.FocusOnStartup
    "    Runner.Layout
    "    Runner.RestoreLayout
    "    Runner.View.Close.Group
    "    Runner.View.Popup
    "    Runner.View.Toolbar
    "    RunnerActions
    "    RunnerActionsTouchbar
    "    RunnerLayoutActions
    "    RunPythonToolwindowAction
    "    RunSetupPyTask
    "    runShellFileAction                                 <C-S-R>
    "    RunTargetAction                                    <M-S-F10>
    "    RunTestGroup
    "    RunToCursor                                        <A-F9> Force touch
    "    Rust.Build                                         <M-F9>
    "    Rust.Cargo
    "    Rust.ConsoleREPL
    "    Rust.CreateNewGithubIssue
    "    Rust.GenerateConstructor
    "    Rust.MacroExpansionActions
    "    Rust.NewCargoCrate
    "    Rust.NewRustFile
    "    Rust.ProjectView
    "    Rust.ReexpandMacrosAction
    "    Rust.RsConvertToNamedFields
    "    Rust.RsConvertToTuple
    "    Rust.RsDowngradeModuleToFile
    "    Rust.RsExtractEnumVariant
    "    Rust.RsPromoteModuleToDirectoryAction
    "    Rust.ShowRecursiveMacroExpansionAction
    "    Rust.ShowSingleStepMacroExpansionAction
    "    SafeDelete                                         <M-Del>
    "    SaveAll                                            <M-S>
    "    SaveAsNewFormat
    "    SaveAsTemplate
    "    SaveDocument
    "    SaveFileAsTemplate
    "    SaveProjectAsTemplate
    "
    "

    "    ScopeView.EditScopes
    "    ScopeViewPopupMenu
    "    Scratch.ChangeLanguage
    "    ScrollPane-scrollDown
    "    ScrollPane-scrollEnd
    "    ScrollPane-scrollHome
    "    ScrollPane-scrollLeft
    "    ScrollPane-scrollRight
    "    ScrollPane-scrollUp
    "    ScrollPane-unitScrollDown
    "    ScrollPane-unitScrollLeft
    "    ScrollPane-unitScrollRight
    "    ScrollPane-unitScrollUp
    "    ScrollPaneActions
    "    ScrollTreeToCenter
    "    SearchEverywhere
    "    SearchEverywhere.CompleteCommand                   <Tab>
    "    SearchEverywhere.NavigateToNextGroup               <Pagedown> <M-Down>
    "    SearchEverywhere.NavigateToPrevGroup               <Pageup> <M-Up>
    "    SearchEverywhere.NextTab                           <Tab>
    "    SearchEverywhere.PrevTab                           <S-Tab>
    "    SearchEverywhere.SelectItem                        <CR>
    "    SearchEverywhereActions
    "    SelectAllOccurrences                               <M-C-G>
    "    SelectIn                                           <A-F1>
    "    SelectInProjectView
    "    SelectNextOccurrence                               <C-G>
    "    SelectVirtualTemplateElement                       <Tab>
    "    SendEOF                                            <M-D>
    "
    "    SendFeedback
    "    SendToFavoritesGroup
    "    Servers.Deploy
    "    Servers.DeployWithDebug
    "    Servers.Undeploy
    "    ServiceView.ActivateDefaultRemoteServersServiceViewContributor
    "    ServiceView.ActivateRunDashboardServiceViewContributor
    "    ServiceView.AddService                             <M-N> <C-CR>
    "    ServiceView.Filter
    "    ServiceView.GroupBy
    "    ServiceView.GroupByContributor                     <C-T>
    "    ServiceView.GroupByServiceGroups                   <C-P>
    "    ServiceView.JumpToServices                         <M-Up> <A-Home>
    "    ServiceView.OpenEachInNewTab
    "    ServiceView.OpenInNewTab
    "    ServiceView.OpenInNewTabGroup
    "    ServiceView.ShowServices                           <M-S-T>
    "    ServiceView.SplitByType
    "    ServiceViewItemPopup
    "    ServiceViewItemPopupGroup
    "    ServiceViewItemToolbar
    "    ServiceViewItemToolbarGroup
    "    ServiceViewTreeToolbar
    "    SetNextStatement
    "    SetShortcutAction                                  <A-CR>
    "    SeverityEditorDialog
    "    ShelfChanges.Settings
    "    Shelve.KeymapGroup
    "    ShelveChanges.UnshelveWithDialog                   <M-S-U>
    "    ShelvedChanges.CleanMarkedToDelete
    "    ShelvedChanges.ImportPatches
    "    ShelvedChanges.Rename                              <F2> <S-F6>
    "    ShelvedChanges.Restore
    "    ShelvedChanges.ShowHideDeleted
    "    ShelvedChanges.ShowRecentlyDeleted
    "    ShelvedChangesPopupMenu
    "    ShelvedChangesToolbar
    "    ShGenerateForLoop
    "    ShGenerateGroup
    "    ShGenerateUntilLoop
    "    ShGenerateWhileLoop
    "    Show.Current.Revision
    "    ShowAnnotateOperationsPopupGroup
    "    ShowBackwardPackageDeps
    "    ShowBlankDiffWindow
    "    ShowBookmarks                                      <M-F3>
    "    ShowColorPicker
    "    ShowContent                                        <C-Down>
    "    ShowDependenciesOnTarget
    "    ShowDiscoveredTests
    "    ShowErrorDescription                               <M-F1>
    "    ShowExecutionPoint                                 <A-F10>
    "    ShowExperiments
    "    ShowFilePath                                       <M-A-F12>
    "    ShowFilterPopup                                    <A-C-F>
    "    ShowFontsUsedByEditor
    "    ShowGutterIconsSettings
    "    ShowIntentionActions                               <A-CR>
    "    ShowIntentionsGroup
    "    ShowKotlinBytecode
    "    ShowLiveRunConfigurations
    "    ShowLog
    "    ShowModulesDependencies
    "    ShowNavBar                                         <M-Up> <A-Home>
    "    ShowPackageCycles
    "    ShowPackageDeps
    "    ShowPackageDepsGroup
    "    ShowParameterHintsSettings
    "    ShowPopupMenu
    "    ShowProcessWindow
    "    ShowProjectStructureSettings                       <M-;>
    "    ShowRecentFindUsagesGroup
    "    ShowRecentTests                                    <M-S-;>
    "    ShowReformatFileDialog                             <M-A-S-L>
    "    ShowRegistry
    "    ShowSearchHistory                                  <A-Down>
    "    ShowSettings                                       <M-,>
    "    ShowSettingsAndFindUsages                          <M-A-S-F7>
    "    ShowSettingsWithAddedPattern
    "    ShowSiblings
    "    ShowTips
    "    ShowUsages                                         <M-A-F7>
    "    SilentCodeCleanup
    "    SliceBackward
    "    SliceForward
    "    SmartSelect                                        <A-Up>
    "    SmartStepInto                                      <S-F7>
    "    SmartTypeCompletion                                <C-S- >
    "    SmartUnSelect                                      <A-Down>
    "    SmRunTestGroup
    "    SplitHorizontally
    "    SplitVertically
    "    StandardMacroActions
    "    Start.Use.Vcs
    "    StartStopMacroRecording
    "    StepInto                                           <F7>
    "    StepIntoMyCode                                     <A-S-F7>
    "    StepOut                                            <S-F8>
    "    StepOver                                           <F8>
    "    Stop                                               <M-F2>
    "    StopBackgroundProcesses                            <M-S-F2>
    "    StoreDefaultLayout
    "    StreamTracerAction
    "    StretchSplitToBottom
    "    StretchSplitToLeft
    "    StretchSplitToRight
    "    StretchSplitToTop
    "    StructuralSearchActions
    "    StructuralSearchPlugin.StructuralReplaceAction
    "    StructuralSearchPlugin.StructuralSearchAction
    "    StructureViewCompileGroup
    "    StructureViewPopupMenu
    "    SuppressFixes
    "    SurroundWith                                       <M-A-T>
    "    SurroundWithEmmet
    "    SurroundWithLiveTemplate                           <M-A-J>
    "    SwapSidesInDiffWindow
    "    SwitchCoverage                                     <M-A-F6>
    "    Switcher                                           <C-Tab> <C-S-Tab>
    "    SwitcherIterateItems                               <M-E>
    "    SwitcherRecentEditedChangedToggleCheckBox          <M-E>
    "    Synchronize                                        <M-A-Y>
    "    SynchronizeCurrentFile
    "    SyncSettings
    "    Table-scrollDownChangeSelection                    <Pagedown>
    "    Table-scrollDownExtendSelection                    <S-Pagedown>
    "    Table-scrollUpChangeSelection                      <Pageup>
    "    Table-scrollUpExtendSelection                      <S-Pageup>
    "    Table-selectFirstRow                               <M-Home>
    "    Table-selectFirstRowExtendSelection                <M-S-Home>
    "    Table-selectLastRow                                <M-End>
    "    Table-selectLastRowExtendSelection                 <M-S-End>
    "    Table-selectNextColumn                             <Right> <C-F>
    "    Table-selectNextColumnExtendSelection              <S-Right>
    "    Table-selectNextRow                                <Down> <C-N>
    "    Table-selectNextRowExtendSelection                 <S-Down>
    "    Table-selectPreviousColumn                         <Left> <C-B>
    "    Table-selectPreviousColumnExtendSelection          <S-Left>
    "    Table-selectPreviousRow                            <Up> <C-P>
    "    Table-selectPreviousRowExtendSelection             <S-Up>
    "    TableActions
    "    TabList
    "    TabsActions
    "    task.actions
    "    tasks.analyze.stacktrace
    "    tasks.and.contexts
    "    tasks.close                                        <A-S-W>
    "    tasks.configure.servers
    "    tasks.create.changelist
    "    tasks.edit
    "    tasks.goto                                         <A-S-N>
    "    tasks.group
    "    tasks.open.in.browser                              <A-S-B>
    "    tasks.show.task.description
    "    tasks.switch                                       <A-S-T>
    "    tasks.toolbar.group
    "    TechnicalSupport
    "    TemplateParametersNavigation
    "    TemplateProjectProperties
    "    TemplateProjectStructure
    "    Terminal.CopySelectedText                          <M-C> <M-Ins>
    "    Terminal.MoveToEditor
    "    Terminal.MoveToolWindowTabLeft                     <M-A-S-Left>
    "    Terminal.MoveToolWindowTabRight                    <M-A-S-Right>
    "    Terminal.NextSplitter                              <A-Tab>
    "    Terminal.OpenInTerminal
    "    Terminal.Paste                                     <M-V> <S-Ins>
    "    Terminal.PrevSplitter                              <A-S-Tab>
    "    Terminal.RenameSession
    "    Terminal.SmartCommandExecution.Debug               <M-S-CR>
    "    Terminal.SmartCommandExecution.Run                 <M-CR>
    "    Terminal.SwitchFocusToEditor                       <Esc>
    "    TerminalSplitActionBase$Horizontal
    "    TerminalSplitActionBase$Vertical
    "    TestData.Navigate                                  <M-C-Up>
    "    TestTreePopupMenu
    "    TextComponent.ClearAction
    "    TodoMainGroup
    "    TodoViewGroupByFlattenPackage                      <C-F>
    "    TodoViewGroupByGroup
    "    TodoViewGroupByShowModules                         <C-M>
    "    TodoViewGroupByShowPackages                        <C-P>
    "    ToggleBookmark                                     <F3>
    "    ToggleBookmark0                                    <C-S-0>
    "    ToggleBookmark1                                    <C-S-1>
    "    ToggleBookmark2                                    <C-S-2>
    "    ToggleBookmark3                                    <C-S-3>
    "    ToggleBookmark4                                    <C-S-4>
    "    ToggleBookmark5                                    <C-S-5>
    "    ToggleBookmark6                                    <C-S-6>
    "    ToggleBookmark7                                    <C-S-7>
    "    ToggleBookmark8                                    <C-S-8>
    "    ToggleBookmark9                                    <C-S-9>
    "    ToggleBookmarkWithMnemonic                         <A-F3>
    "    ToggleBreakpointAction
    "    ToggleBreakpointEnabled
    "    ToggleCompletionHintsAction
    "    ToggleContentUiTypeMode
    "    ToggleDistractionFreeMode
    "    ToggleDockMode
    "    ToggleFieldBreakpoint
    "    ToggleFindInSelection                              <A-C-E>
    "    ToggleFloatingMode
    "    ToggleFullScreen                                   <M-C-F>
    "    ToggleFullScreenGroup
    "    ToggleInlayHintsGloballyAction
    "    ToggleInlineHintsAction
    "    ToggleLineBreakpoint                               <M-F8>
    "    ToggleMethodBreakpoint
    "    TogglePinnedMode
    "    TogglePopupHints
    "    TogglePowerSave
    "    TogglePresentationMode
    "    ToggleReadOnlyAttribute
    "    ToggleRenderedDocPresentation                      <A-C-Q>
    "    ToggleRenderedDocPresentationForAll
    "    ToggleSideMode
    "    ToggleTemporaryLineBreakpoint                      <M-A-S-F8>
    "    ToggleTypeHints
    "    ToggleTypeMismatchHints
    "    ToggleWindowedMode
    "    ToggleZenMode
    "    ToolbarFindGroup
    "    ToolbarMakeGroup
    "    ToolbarRunGroup
    "    ToolsBasicGroup
    "    ToolsMenu
    "    ToolsXmlGroup
    "    ToolWindowContextMenu
    "    ToolWindowsGroup
    "    TouchBar
    "    TouchBarDebug
    "    TouchBarDebug.ForceStepButtons
    "    TouchBarDebug.StepButtons
    "    TouchBarDebug_alt
    "    TouchBarDefault
    "    TouchBarDefault_alt
    "    TouchBarDefault_cmd
    "    TouchBarDefault_cmd.alt
    "    TouchBarDefault_ctrl
    "    TouchBarDefault_shift
    "    TouchBarDefaultOptionalGroup
    "    Tree-scrollDownChangeSelection                     <Pagedown>
    "    Tree-scrollDownExtendSelection                     <S-Pagedown>
    "    Tree-scrollUpChangeSelection                       <Pageup>
    "    Tree-scrollUpExtendSelection                       <S-Pageup>
    "    Tree-selectChild                                   <Right> <C-F>
    "    Tree-selectChildExtendSelection                    <S-Right>
    "    Tree-selectFirst                                   <M-Home>
    "    Tree-selectFirstExtendSelection                    <M-S-Home>
    "    Tree-selectLast                                    <M-End>
    "    Tree-selectLastExtendSelection                     <M-S-End>
    "    Tree-selectNext                                    <Down> <C-N>
    "    Tree-selectNextExtendSelection                     <S-Down>
    "    Tree-selectParent                                  <Left> <C-B>
    "    Tree-selectParentExtendSelection                   <S-Left>
    "    Tree-selectPrevious                                <Up> <C-P>
    "    Tree-selectPreviousExtendSelection                 <S-Up>
    "    TreeActions
    "    TreeNodeExclusion
    "    TurnRefsToSuper
    "    TW.MoveToGroup
    "    TW.ViewModeGroup
    "    TWViewModes
    "    TWViewModesLegacy
    "    TypeHierarchy                                      <C-H>
    "    TypeHierarchy.Class
    "    TypeHierarchy.Subtypes
    "    TypeHierarchy.Supertypes
    "    TypeHierarchyBase.BaseOnThisType                   <C-H>
    "    TypeHierarchyPopupMenu
    "    TypeHintsMenu
    "    UiDebugger
    "    UIToggleActions
    "    UndockMode
    "    UnmarkGeneratedSourceRoot
    "    UnmarkRoot
    "    Unscramble
    "    UnselectPreviousOccurrence                         <C-S-G>
    "    Unsplit
    "    UnsplitAll
    "    Unversioned.Files.Dialog
    "    Unversioned.Files.Dialog.Popup
    "    Unwrap                                             <M-S-Del>
    "    UpdateActionGroup
    "    UpdateCopyright
    "    UpdateFiles
    "    UpdateIdeFromSources
    "    UpdateIdeFromSourcesSettings
    "    UpdateRunningApplication                           <M-F10>
    "    UsageGrouping.Directory                            <C-P>
    "    UsageGrouping.DirectoryStructure                   <C-D>
    "    UsageGrouping.FileStructure                        <C-S>
    "    UsageGrouping.FlattenModules                       <C-O>
    "    UsageGrouping.Module                               <C-M>
    "    UsageGrouping.Package                              <C-P>
    "    UsageGrouping.Scope
    "    UsageGrouping.UsageType                            <C-T>
    "    UsageView.Exclude                                  <Del> <BS> <M-BS>
    "    UsageView.Include                                  <S-BS>
    "    UsageView.Popup
    "    UsageView.Remove                                   <M-X> <S-Del>
    "    UsageView.Rerun                                    <M-R>
    "    UsageView.ShowRecentFindUsages                     <A-Down>
    "    ValidateXml
    "    Vcs.ApplySelectedChanges
    "    Vcs.Browse
    "    Vcs.CheckinProjectMenu
    "    Vcs.CheckinProjectToolbar
    "    Vcs.CherryPick
    "    Vcs.CommitExecutor.Actions
    "    Vcs.CopyRevisionNumberAction
    "    Vcs.Diff.ExcludeChangedLinesFromCommit
    "    Vcs.Diff.IncludeOnlyChangedLinesIntoCommit
    "    Vcs.EditSource                                     <M-Down> <F4>
    "    Vcs.FileHistory.ContextMenu
    "    Vcs.FileHistory.PresentationSettings
    "    Vcs.FileHistory.Toolbar
    "    Vcs.Force.Push
    "    Vcs.GetVersion
    "    Vcs.History
    "    Vcs.Import
    "    Vcs.IntegrateProject
    "    Vcs.KeymapGroup
    "    Vcs.Log.AlignLabels
    "    Vcs.Log.AnnotateRevisionAction
    "    Vcs.Log.ChangesBrowser.Popup
    "    Vcs.Log.ChangesBrowser.Toolbar
    "    Vcs.Log.CollapseAll
    "    Vcs.Log.CompactReferencesView
    "    Vcs.Log.CompareRevisions
    "    Vcs.Log.ContextMenu
    "    Vcs.Log.Diff.Preview.Location
    "    Vcs.Log.EnableFilterByRegexAction
    "    Vcs.Log.ExpandAll
    "    Vcs.Log.FocusTextFilter                            <M-L>
    "    Vcs.Log.GetVersion
    "    Vcs.Log.GoToChild                                  <Left>
    "    Vcs.Log.GoToParent                                 <Right>
    "    Vcs.Log.GoToRef                                    <M-F>
    "    Vcs.Log.HighlightersActionGroup
    "    Vcs.Log.IntelliSortChooser
    "    Vcs.Log.LayoutConfiguration
    "    Vcs.Log.MatchCaseAction
    "    Vcs.Log.MoveDiffPreviewToBottom
    "    Vcs.Log.MoveDiffPreviewToRight
    "    Vcs.Log.OpenAnotherTab
    "    Vcs.Log.OpenRepositoryVersion
    "    Vcs.Log.PreferCommitDate
    "    Vcs.Log.PresentationSettings
    "    Vcs.Log.Refresh                                    <M-R>
    "    Vcs.Log.ResumeIndexing
    "    Vcs.Log.ShowAllAffected                            <M-C-A>
    "    Vcs.Log.ShowChangesFromParents
    "    Vcs.Log.ShowDetailsAction
    "    Vcs.Log.ShowDiffPreview
    "    Vcs.Log.ShowLongEdges
    "    Vcs.Log.ShowOnlyAffectedChanges
    "    Vcs.Log.ShowOtherBranches
    "    Vcs.Log.ShowRootsColumnAction
    "    Vcs.Log.ShowTagNames
    "    Vcs.Log.ShowTooltip                                <F1> <C-J> button=2 clickCount=1 modifiers=128
    "    Vcs.Log.TextFilterSettings
    "    Vcs.Log.ToggleColumns
    "    Vcs.Log.Toolbar
    "    Vcs.Log.Toolbar.Internal
    "    Vcs.Log.Toolbar.RightCorner
    "    Vcs.MessageActionGroup
    "    Vcs.MoveChangedLinesToChangelist                   <M-S-M>
    "    Vcs.OpenRepositoryVersion
    "    Vcs.Operations.Popup
    "    Vcs.Operations.Popup.Annotate
    "    Vcs.Operations.Popup.NonVcsAware
    "    Vcs.Operations.Popup.Vcs.Providers
    "    Vcs.Operations.Popup.VcsAware
    "    Vcs.Operations.Popup.VcsNameSeparator
    "    Vcs.Push                                           <M-S-K>
    "    Vcs.Push.Actions
    "    Vcs.QuickListPopupAction                           <C-V>
    "    Vcs.ReformatCommitMessage                          <M-A-L>
    "    Vcs.RefreshFileHistory                             <M-R>
    "    Vcs.RefreshStatuses
    "    Vcs.RepositoryChangesBrowserMenu
    "    Vcs.RepositoryChangesBrowserToolbar
    "    Vcs.RevertSelectedChanges
    "    Vcs.RollbackChangedLines                           <M-A-Z>
    "    Vcs.Show.Local.Changes
    "    Vcs.Show.Log
    "    Vcs.Show.Shelf
    "    Vcs.Show.Toolwindow.Tab
    "    Vcs.ShowDiffWithLocal
    "    Vcs.ShowDiffWithLocal.Before
    "    Vcs.ShowHistoryForBlock
    "    Vcs.ShowHistoryForRevision
    "    Vcs.ShowMessageHistory                             <C-M> <M-E>
    "    Vcs.ShowTabbedFileHistory
    "    Vcs.Specific
    "    Vcs.ToggleAmendCommitMode                          <A-C-M>
    "    Vcs.UpdateProject                                  <M-T>
    "    Vcs.VcsClone
    "    VcsFileGroupPopup
    "    VcsGeneral.KeymapGroup
    "    VcsGlobalGroup
    "    VcsGroup
    "    VcsGroups
    "    VcsHistory.ShowAllAffected                         <M-C-A>
    "    VcsHistoryActionsGroup
    "    VcsHistoryActionsGroup.Toolbar
    "    VcsHistoryInternalGroup.Popup
    "    VcsHistoryInternalGroup.Toolbar
    "    VcsNavBarToobarActions
    "    VcsSelectionHistoryDialog.Popup
    "    VcsShowCurrentChangeMarker
    "    VcsShowNextChangeMarker                            <A-C-S-Down>
    "    VcsShowPrevChangeMarker                            <A-C-S-Up>
    "    VcsToobarActions
    "    VcsToolbarLabelAction
    "    VcsTouchBarGroup
    "    VersionControlsGroup
    "    ViewAppearanceGroup
    "    ViewBreakpoints                                    <M-S-F8>
    "    ViewImportPopups
    "    ViewInplaceComments                                <A-S-\>
    "    ViewMainMenu
    "    ViewMembersInNavigationBar
    "    ViewMenu
    "    ViewNavigationBar
    "    ViewOfflineInspection
    "    ViewRecentActions
    "    ViewSource                                         <M-CR>
    "    ViewStatusBar
    "    ViewStatusBarWidgetsGroup
    "    ViewToolBar
    "    ViewToolButtons
    "    VimActions
    "    VimPluginToggle
    "    VimShortcutKeyAction
    "    WeighingNewGroup

    "    WhatsNewAction
    "    WindowMenu
    "    WindowMode
    "    working.context
    "    WrapReturnValue
    "    XDebugger.Actions
    "    XDebugger.AttachGroup
    "    XDebugger.AttachToProcess                          <A-S-F5>
    "    XDebugger.CompareValueWithClipboard
    "    XDebugger.CopyName
    "    XDebugger.CopyValue                                <M-C>
    "    XDebugger.CopyWatch                                <M-D>
    "    XDebugger.EditWatch                                <F2>
    "    XDebugger.Evaluate.Code.Fragment.Editor.Popup
    "    XDebugger.Evaluation.Dialog.Tree.Popup
    "    XDebugger.Frames.TopToolbar
    "    XDebugger.Frames.Tree.Popup
    "    XDebugger.Inline
    "    XDebugger.Inspect
    "    XDebugger.Inspect.Tree.Popup
    "    XDebugger.JumpToSource                             <M-Down> <F4>
    "    XDebugger.JumpToTypeSource                         <S-F4>
    "    XDebugger.MoveWatchDown                            <A-S-Down>
    "    XDebugger.MoveWatchUp                              <A-S-Up>
    "    XDebugger.MuteBreakpoints
    "    XDebugger.NewWatch
    "    XDebugger.PinToTop
    "    XDebugger.RemoveAllWatches
    "    XDebugger.RemoveWatch                              <Del> <BS> <M-BS>
    "    XDebugger.Settings
    "    XDebugger.SetValue                                 <F2>
    "    XDebugger.SwitchWatchesInVariables
    "    XDebugger.ToggleSortValues
    "    XDebugger.ToolWindow.LeftToolbar
    "    XDebugger.ToolWindow.TopToolbar
    "    XDebugger.UnmuteOnStop
    "    XDebugger.ValueGroup
    "    XDebugger.Variables.Tree.Popup
    "    XDebugger.Variables.Tree.Toolbar
    "    XDebugger.Watches.Tree.Popup
    "    XDebugger.Watches.Tree.Toolbar
    "    XmlGenerateToolsGroup
    "    XPathView.Actions.Evaluate                         <M-A-X>
    "    XPathView.Actions.FindByExpression                 <M-A-X>
    "    XPathView.Actions.ShowPath                         <M-A-X>
    "    XPathView.EditorPopup
    "    XPathView.MainMenu.Search
    "    XPathView.XSLT.Associations
    "    XSD2Document
    nnoremap <LEADER>z    :action ZoomCurrentWindow<cr>
endif

