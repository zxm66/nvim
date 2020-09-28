

call plug#begin("~/.config/nvim/plugged")
" Plug 'itchyny/calendar.vim' 
" Autoformat
Plug 'Chiel92/vim-autoformat'
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
Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}

Plug 'Yggdroot/indentLine'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"Plug 'easymotion/vim-easymotion'
"Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
" Auto Complete
" Plug 'Valloric/YouCompleteMe'
Plug 'puremourning/vimspector'
Plug 'honza/vim-snippets'
" Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-pathogen'
" Plug 'dense-analysis/ale'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'connorholyday/vim-snazzy'
" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'kristijanhusak/defx-icons'
" Plug 'airblade/vim-gitgutter'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'amix/vim-zenroom2'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'
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

Plug 'tmhedberg/SimpylFold'

call plug#end()
let g:indent_guides_guide_size            = 1  
let g:indent_guides_start_level           = 2 

let g:SimpylFold_docstring_preview = 1
