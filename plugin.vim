

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
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
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
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'

" pdf
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" notes
Plug 'xolox/vim-notes'
call plug#end()



" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
"set completeopt=noinsert,menuone,noselect
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

map <LEADER>f :FZF ~/workSpace/<CR>
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




