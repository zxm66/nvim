

call plug#begin("~/.config/nvim/plugged")
Plug 'itchyny/calendar.vim' 
" Autoformat
Plug 'Chiel92/vim-autoformat'
" debug
Plug 'puremourning/vimspector'
" Plug 'mhinz/vim-startify'
" Plug 'glepnir/dashboard-nvim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/BufOnly.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mbbill/undotree'
"Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'Yggdroot/indentLine'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"Plug 'easymotion/vim-easymotion'
"Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
" Auto Complete
" Plug 'Valloric/YouCompleteMe'
" Plug 'puremourning/vimspector'
" Plug 'honza/vim-snippets'
" Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-pathogen'
" Plug 'dense-analysis/ale'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'connorholyday/vim-snazzy'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'kristijanhusak/defx-icons'
" Plug 'airblade/vim-gitgutter'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
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
Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"Plug 'xolox/vim-notes'
call plug#end()
let g:indent_guides_guide_size            = 1  
let g:indent_guides_start_level           = 2 

let g:markdown_fenced_languages = ['css', 'js=javascript']
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


" let g:NERDTreeDirArrowExpandable = '👉'
" let g:NERDTreeDirArrowCollapsible = '👇'
" there is a question ,that the nvim become slowly
" let NERDTreeMapCustomOpen = "l"
" let NERDTreeMapCloseDir = "h"


