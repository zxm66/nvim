let g:floaterm_width = 0.8       
let g:floaterm_height = 0.8

""" Configuration 
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F10>'


hi Floaterm guibg=black
hi FloatermBorder guibg=gray guifg=blue

function s:floatermSettings()
    setlocal number
    " more settings
endfunction

autocmd FileType floaterm call s:floatermSettings()

