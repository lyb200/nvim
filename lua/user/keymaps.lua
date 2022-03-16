local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
keymap("", "s", "<Nop>", opts)
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- my Keymaps
keymap("v", "Y", '"+y', opts)
-- keymap("n", ";", ":", opts)
-- vim.cmd [[nnoremap ; :]]
-- vim.cmd [[vnoremap ; :]]
-- vim.cmd [[nnoremap <space>; :]]

-- j, k  Store relative line number jumps in the jumplist
-- if they exceed a threshold.
keymap('n', 'k', "(v:count > 5 ? \"m'\" . v:count : '') . 'k'", {noremap = true, expr = true})
keymap('n', 'j', "(v:count > 5 ? \"m'\" . v:count : '') . 'j'", {noremap = true, expr = true})

-- select, delete, yank all document
keymap("o", "al", ":<c-u>normal! ggVG<CR>", opts)
keymap("n", "val", "ggVG", opts)
-- save and quit
keymap("n", "S", ":w<CR>", opts)
keymap("n", "Q", ":q<CR>", opts)
vim.cmd[[
  cnoreabbrev Wq wq
  cnoreabbrev WQ wq
  cnoreabbrev W w
  cnoreabbrev Q q
]]

-- Allow saving of files as sudo when I forgot to start vim using sudo.
-- keymap("c", "<C-S>", ":<C-u>w !sudo tee > /dev/null %", opts)
vim.cmd[[cnoremap <C-S> :<C-u>w !sudo tee > /dev/null %]]

keymap("n", "/", "/\\v", {})
-- keymap("v", "/", "/\\v", {})
keymap("n", "?", "?\\v", {})
-- keymap("v", "?", "?\\v", {})

keymap('n', '&', ':&&<CR>', {noremap = true})
keymap('x', '&', ':&&<CR>', {noremap = true})

vim.cmd [[exec "nohlsearch"]]

-- command line mode cursor movement
-- keymap("c", "<C-A>", "<Home>", opts)
-- keymap("c", "<C-E>", "<END>", opts)
-- keymap("c", "<C-P>", "<UP>", opts)
-- keymap("c", "<C-N>", "<Down>", opts)
-- keymap("c", "<C-H>", "<Left>", opts)
-- keymap("c", "<C-L>", "<Right>", opts)
-- keymap("c", "<M-H>", "<S-Left>", opts)
-- keymap("c", "<M-L>", "<S-Right>", opts)
vim.cmd [[cnoremap <C-A> <Home>]]
vim.cmd [[cnoremap <C-E> <End>]]
vim.cmd [[cnoremap <C-P> <Up>]]
vim.cmd [[cnoremap <C-N> <Down>]]
vim.cmd [[cnoremap <C-H> <Left>]]
vim.cmd [[cnoremap <C-L> <Right>]]
vim.cmd [[cnoremap <M-H> <S-Left>]]
vim.cmd [[cnoremap <M-L> <S-Right>]]

keymap("i", "<C-K>", "<UP>", opts)
keymap("i", "<C-J>", "<Down>", opts)
keymap("i", "<C-B>", "<Left>", opts)
keymap("i", "<C-L>", "<Right>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":move .+1<CR>==", opts)
keymap("v", "<A-k>", ":move .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Custom
keymap("n", "<esc><esc>", "<cmd>nohlsearch<cr>", opts)
keymap("n", "<TAB>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
-- keymap("n", "<F1>", ":e ~/Notes/<cr>", opts)
keymap("n", "<F3>", ":e .<cr>", opts)
keymap("n", "<F4>", "<cmd>Telescope resume<cr>", opts)
keymap("n", "<F5>", "<cmd>Telescope commands<CR>", opts)
keymap(
  "n",
  "<F6>",
  [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
  opts
)
keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
keymap("n", "<F8>", "<cmd>TSPlaygroundToggle<cr>", opts)
keymap("n", "<F11>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], opts)
keymap(
  "n",
  "<C-p>",
  "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
  opts
)
keymap("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
-- keymap("n", "<C-s>", "<cmd>vsplit<cr>", opts)
keymap("n", "<C-z>", "<cmd>ZenMode<cr>", opts)
keymap("n", "<c-n>", ":e ~/Notes/<cr>", opts)
-- keymap("n", "<C-\\>", "<cmd>vsplit<cr>", opts)
-- vim.cmd[[nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn]]
-- vim.cmd[[nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN]]
-- keymap("n", "c*", [[/\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn]], opts)
-- keymap("n", "c#", [[?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN]], opts)
-- keymap("n", "gx", [[:execute '!brave ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)
keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)
-- Change '<CR>' to whatever shortcut you like :)
vim.api.nvim_set_keymap('n', '<CR>', '<cmd>NeoZoomToggle<CR>', { noremap=true, silent=true, nowait=true })

