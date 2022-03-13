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

-- select, delete, yank all document
keymap("o", "al", ":<c-u>normal! ggVG<CR>", opts)
keymap("n", "val", "ggVG", opts)
-- save and quit
keymap("n", "S", ":w<CR>", opts)
keymap("n", "Q", ":q<CR>", opts)

keymap("n", "/", "/\\v", {})
keymap("v", "/", "/\\v", {})
keymap("n", "?", "?\\v", {})
keymap("v", "?", "?\\v", {})
-- keymap("n", "\s", ":%s/\\v/g<Left><Left>", opts)
-- keymap("v", "\s", ":s/\\v/g<Left><Left>", opts)
vim.cmd[[nnoremap \s :%s/\v/g<left><left>]]
vim.cmd[[vnoremap \s :s/\v/g<left><left>]]

vim.cmd [[exec "nohlsearch"]]

-- Open the init.lua file anytime you
keymap("n", ",n", ":e $MYVIMRC<CR>", opts)
-- Tab management
keymap("n", ",tc", ":tabedit<CR>", opts)
keymap("n", ",mt", ":-tabmove<CR>", opts)
keymap("n", ",mT", ":+tabmove<CR>", opts)
keymap("n", ",mf", ":0tabmove<CR>", opts)
keymap("n", ",ml", ":$tabmove<CR>", opts)
-- search adjacent duplicate words
-- noremap sdw /\(\<\w\+\>\)\_s*\1
vim.cmd[[noremap \dw /\v(<\w+>)\_s*<\1><cr>]]

-- Opening a terminal window
keymap("n", ",s/", ":set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>", opts)

-- Press <leader><space> twice to jump to the next '' and edit it
-- noremap <SPACE><SPACE> <Esc>/<++><CR>:nohlsearch<CR>c4l
keymap("n", ",;", "<Esc>/<++><CR>:nohlsearch<CR>c4l", opts)
keymap("i", ",;", "<Esc>/<++><CR>:nohlsearch<CR>c4l", opts)
-- Toggle spelling check with sc
keymap("n", ",sc", ":set spell!<CR>", opts)
-- 定于光标之前的单词，然后为它查找第一个拼写建议
-- find the first spell suggestion for it.
keymap("n", "<A-S>", "ea<C-X>s", opts)
keymap("i", "<A-S>", "<Esc>ea<C-X>s", opts)

-- 手动设置文件类型
vim.cmd[[nnoremap ,sf :set filetype=]]
-- input telescope
vim.cmd[[nnoremap ,ts :Telescope ]]

-- Split windows management
keymap("n", ",sl", "set splitright<CR>:vnew<cr>", opts)
keymap("n", ",sh", "set nosplitright<CR>:vnew<cr>", opts)
keymap("n", ",sj", "set splitbelow<CR>:new<cr>", opts)
keymap("n", ",sk", "set nosplitbelow<CR>:new<cr>", opts)
-- exchange tab
keymap("n", ",sV", "<C-W>t<C-w>H<C-W>l", opts)
keymap("n", ",sH", "<C-W>t<C-w>K<C-W>j", opts)
-- Rotate screens
keymap("n", ",srh", "<C-W>b<C-w>K", opts)
keymap("n", ",srv", "<C-W>b<C-w>H", opts)

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
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

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

