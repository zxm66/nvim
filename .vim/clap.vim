" let g:clap_theme = 'material_design_dark'

let g:clap_theme = { 'search_text': {'guifg': 'red', 'ctermfg': 'red'} }


autocmd FileType clap_input inoremap <silent> <buffer> <C-n> <C-R>=clap#handler#navigate_result('down')<CR>
autocmd FileType clap_input inoremap <silent> <buffer> <C-p> <C-R>=clap#handler#navigate_result('up')<CR>














