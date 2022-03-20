local keymap = vim.api.nvim_set_keymap

vim.g.rnvimr_ex_enable = 1
vim.g.rnvimr_pick_enable = 1
vim.g.rnvimr_draw_border = 0
vim.g.rnvimr_bw_enable = 1

keymap("n", "<M-r>", ":RnvimrToggle<CR>", { noremap = true, silent = true })
keymap("t", "<M-r>", "<C-\\><C-n>:RnvimrToggle<CR>", { noremap = true, silent = true })
keymap("t", "<M-s>", "<C-\\><C-n>:RnvimrResize<CR>", { noremap = true, silent = true })

vim.cmd [[
  highlight link RnvimrNormal CursorLine

  "let g:rnvimr_action = {
  "      \ '<C-t>': 'NvimEdit tabedit',
  "      \ '<C-x>': 'NvimEdit split',
  "      \ '<C-v>': 'NvimEdit vsplit',
  "      \ 'gw': 'JumpNvimCwd',
  "      \ 'yw': 'EmitRangerCwd'
  "      \ }

  " Add views for Ranger to adapt the size of floating window
  let g:rnvimr_ranger_views = [
              \ {'minwidth': 90, 'ratio': []},
              \ {'minwidth': 50, 'maxwidth': 89, 'ratio': [1,1]},
              \ {'maxwidth': 49, 'ratio': [1]}
              \ ]

  "let g:rnvimr_layout = { 'relative': 'editor',
  "      \ 'width': &columns,
  "      \ 'height': &lines,
  "      \ 'col': 0,
  "      \ 'row': 0,
  "      \ 'style': 'minimal' }

  let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]
]]
