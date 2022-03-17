local options = {
  backup = true, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  -- colorcolumn = "80",
  colorcolumn = "120",
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  incsearch = true,
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = true, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  ignorecase = true, -- ignore case in search patterns
  smartcase = true, -- smart case
  autoindent = true,
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 8, -- is one of my fav
  sidescrolloff = 8,
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
  guifont = "agave Nerd Font:h17", -- the font used in graphical neovim applications

  -- my configure
  backspace = "indent,eol,start",
  undolevels = 5000,
  ttyfast = true,
  lazyredraw = true,
  textwidth = 0,
  startofline = true, -- move the cursor to the first non-blank of the line
  visualbell = true, -- use visual bell instead of beeping
  virtualedit = "block", -- allow virtual editing in Visual block mode
  autochdir = true, -- can change directory
  shiftround = true, -- round indent to multiple of 'shiftwidth'
  list = true, -- show tab and tailable
  -- listchars = {'tab:\|\ ','trail:▫'}
  history = 1000, -- keep 1000 items in the history
  ruler = true,
  showcmd = true,
  ttimeoutlen = 50,
  foldlevel = 99,
  foldenable = true,
  wildmode = { "list:longest", "full" },
  wildmenu = true, -- show the possible matches just the above command line
  inccommand = "split", -- shows the effects of :substitute, :smagic, and :snomagic as you type
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

--vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "set whichwrap+=<,>,[,]"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

vim.cmd [[set listchars=tab:\|\ ,trail:▫]]
vim.cmd [[set diffopt+=vertical]] -- show diffs side by side
vim.cmd [[let &t_CO=256]]
vim.cmd [[filetype plugin indent on]]
vim.cmd [[
  if has('unix')
    " set keywordprg=:Man
    set keywordprg=:help
  else
    set keywordprg=:help
  end
]] -- TODO: in linux, keywordprg=:Man, does't work

vim.cmd [[
  if has('linebreak')
    " indent wrapped lines to match start
    set linebreak
    "Arrow pointing downwards then curving rightwards
    let &showbreak='⤷' "⤷(U+2937)
    if exists('&breakindentopt')
      "emphasize broken line by indenting them
      set breakindentopt=shift:2
    endif
  endif
]]

-- vim.cmd [[
--   " open file where you leave the file
--   autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
-- ]]

vim.cmd [[
  if has('win32')
    set backupdir=$HOME/AppData/Local/nvim-data/backup
  else
    set backupdir=$HOME/tmp/backup
  endif

  if has('mksession')
    if has('win32')
      set viewdir=$HOME/AppData/Local/nvim-data/view
    endif
    set viewoptions=cursor,folds,slash,unix
  endif

  if has('persistent_undo')
    set undofile
    if has('unix')
      set undodir=$HOME/tmp/undo
    else
      " set undodir=$HOME/AppData/Local/nvim/undo,.
      set undodir=$HOME/AppData/Local/nvim-data/undo
    endif
  endif
]]
-- -- delete last trailinDTreeToggle
-- vim.cmd[[
--   autocmd BufWritePre * :%s/\s\+$//e
-- ]]
