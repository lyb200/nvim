local opt = vim.opt
local fn = vim.fn
local has = function(x)
  return fn.has(x) == 1
end

local options = {
  -------------------------------------------------------------------
  -- General
  -------------------------------------------------------------------
  mouse = "a", -- allow the mouse to be used in neovim
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  scrolloff = 8, -- is one of my fav
  sidescrolloff = 8,
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  backspace = "indent,eol,start",
  textwidth = 0,
  startofline = true, -- move the cursor to the first non-blank of the line
  autochdir = true, -- can change directory
  history = 1000, -- keep 1000 items in the history
  foldlevel = 99,
  foldenable = true,
  visualbell = true, -- use visual bell instead of beeping
  virtualedit = "block", -- allow virtual editing in Visual block mode

  -------------------------------------------------------------------
  -- Neovim UI
  -------------------------------------------------------------------
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  showmode = true, -- we don't need to see things like -- INSERT -- anymore
  showcmd = true,
  ruler = true,
  showtabline = 2, -- always show tabs
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  shiftround = true, -- round indent to multiple of 'shiftwidth'
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  list = true, -- show tab and tailable
  -- set listchars+=nbsp:⦸   "CIRCLED reverse solidus(U+29B8)
  -- »(U+00BB) «(U+00AB) •(U+2022) ▷(U+25B7) →(U2192) ↲(U21b2)
  listchars = { tab = "| ", trail = "▫" },
  -- listchars = { eol = "↲", tab = "▸ ", trail = "▫" },
  -- colorcolumn = "80",
  colorcolumn = "120",
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  ignorecase = true, -- ignore case in search patterns
  smartcase = true, -- smart case
  hlsearch = true, -- highlight all matches on previous search pattern
  incsearch = true,
  cursorline = true, -- highlight the current line
  numberwidth = 4, -- set number column width to 2 {default 4}
  wildmode = { "list:longest", "full" },
  wildmenu = true, -- show the possible matches just the above command line
  inccommand = "split", -- shows the effects of :substitute, :smagic, and :snomagic as you type
  breakindent = true,
  wrap = false, -- display lines as one long line
  pumheight = 10, -- pop up menu height
  termguicolors = true, -- set term gui colors (most terminals support this)
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
  guifont = "agave Nerd Font:h17", -- the font used in graphical neovim applications

  -------------------------------------------------------------------
  -- Tabs, indent
  -------------------------------------------------------------------
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  smartindent = true, -- make indenting smarter again
  autoindent = true,

  -------------------------------------------------------------------
  -- Memory, CPU
  -------------------------------------------------------------------
  timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
  undolevels = 5000,
  updatetime = 300, -- faster completion (4000ms default)
  synmaxcol = 240, -- Max column for syntax highlight
  ttimeoutlen = 50,
  lazyredraw = true,

  -------------------------------------------------------------------
  -- File
  -------------------------------------------------------------------
  backup = false, -- creates a backup file
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  undofile = true, -- enable persistent undo
  swapfile = false, -- creates a swapfile
}

for k, v in pairs(options) do
  opt[k] = v
end

-- Don't pass message to ins-completion-menu
opt.shortmess:append "c"
opt.iskeyword:append "-"
-- opt.whichwrap:append { "<", ">", "[", "]" } -- hint error
opt.whichwrap:append "<,>,[,]"
opt.formatoptions:remove { "c", "r", "o" }
opt.diffopt:append "vertical" -- show diffs side by side
opt.matchpairs:append "<:>,«:»"

-- some terminal need
vim.cmd [[
  " set color
  let &t_CO=256
  " some version color incorrect
  let &t_ut=''
  " set cursor sharp
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"

  filetype plugin indent on
  syntax enable
  exec "nohlsearch"
]]

if has "unix" then
  opt.keywordprg = ":help" -- this option maybe ":Man"
else
  opt.keywordprg = ":help"
end -- TODO: in linux, keywordprg=:Man, does't work

if has "linebreak" then
  opt.linebreak = true
  --⤷(U+2937)
  opt.showbreak = "⤷"
  if fn.empty "breakindentopt" then
    opt.breakindentopt = "shift:2"
  end
end

vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.perl_host_prog = "/usr/bin/perl"

-- :options can list all configures
-- :h option-list can get help.
