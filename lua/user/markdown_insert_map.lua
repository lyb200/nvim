-- markdown buffer insert keymap

vim.cmd [[
  augroup markdown_insert_keymap
    "autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
    autocmd!
    autocmd Filetype markdown inoremap <buffer><silent> ,; <Esc>/<++><CR>:nohlsearch<CR>"_c4l
    autocmd Filetype markdown inoremap <buffer><silent> ,/ <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
    autocmd Filetype markdown inoremap <buffer><silent> ,n ---<CR><CR>
    autocmd Filetype markdown inoremap <buffer><silent> ,o **** <++><Esc>2F*i
    autocmd Filetype markdown inoremap <buffer><silent> ,s ~~~~ <++><Esc>2F~i
    autocmd Filetype markdown inoremap <buffer><silent> ,i ** <++><Esc>F*i
    autocmd Filetype markdown inoremap <buffer><silent> ,c `` <++><Esc>F`i
    autocmd Filetype markdown inoremap <buffer><silent> ,b ```<CR><++><CR>```<CR><CR><++><Esc>4kA
    autocmd Filetype markdown inoremap <buffer><silent> ,t - [ ]
    autocmd Filetype markdown inoremap <buffer><silent> ,d - [x]
    autocmd Filetype markdown inoremap <buffer><silent> ,m @[TOC](Menu) <++><Esc>F(a
    autocmd Filetype markdown inoremap <buffer><silent> ,p ![](<++>) <++><Esc>F[a
    autocmd Filetype markdown inoremap <buffer><silent> ,a [](<++>) <++><Esc>F[a
    autocmd Filetype markdown inoremap <buffer><silent> ,1 #<Space><CR><++><Esc>kA
    autocmd Filetype markdown inoremap <buffer><silent> ,2 ##<Space><CR><++><Esc>kA
    autocmd Filetype markdown inoremap <buffer><silent> ,3 ###<Space><CR><++><Esc>kA
    autocmd Filetype markdown inoremap <buffer><silent> ,4 ####<Space><CR><++><Esc>kA
    autocmd Filetype markdown inoremap <buffer><silent> ,l --------<CR>
  augroup END
]]
