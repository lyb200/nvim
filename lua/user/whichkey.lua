local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = {
    gc = "Comments",
    gb = "Block comments",
    ds = "Delete surroundings",
    cs = "Change surroundings",
    ys = "You surround",
    yS = "You indent surround",
  },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local m_opts = {
  mode = "n", -- NORMAL mode
  prefix = "m",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local m_mappings = {
  a = { "<cmd>BookmarkAnnotate<cr>", "Annotate" },
  c = { "<cmd>BookmarkClear<cr>", "Clear" },
  m = { "<cmd>BookmarkToggle<cr>", "Toggle" },
  h = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
  j = { "<cmd>BookmarkNext<cr>", "Next" },
  k = { "<cmd>BookmarkPrev<cr>", "Prev" },
  s = {
    "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
    "Show",
  },
  x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
  u = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  -- prefix = ",",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["b"] = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Buffers",
  },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No hlsearch" },
  ["/"] = { '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>', "Comment" },
  ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
  ["R"] = { '<cmd>lua require("renamer").rename()<cr>', "Rename" },
  ["z"] = { "<cmd>ZenMode<cr>", "Zen" },
  ["gy"] = "Gitlinker",

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  r = {
    name = "Replace rename Ranger Run",
    p = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
    f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
    u = { ":call CompileRunGcc()<CR>", "run code" },
    a = { ":RnvimrToggle<CR>", "Ranger<M-r>|<M-s>" },
    n = { "<cmd>lua require('renamer').rename({empty = true})<cr>", "Rename" },
  },

  f = {
    name = "Telescope find",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = {
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Find files",
    },
    t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
    l = { "<cmd>Telescope resume<cr>", "Last Search" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps list" },
    c = { "<cmd>Telescope commands<cr>", "Commands list" },
    s = { "<cmd>Telescope treesitter<cr>", "Symbols in buffer" },
  },

  g = {
    name = "Git",
    -- g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    g = {
      ":FloatermNew --width=0.8 --height=0.96 --wintype=float --name=lazygit --position=center --autoclose=1 lazygit<CR>",
      "Lazygit",
    },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>GitBlameToggle<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
    G = {
      name = "Gist",
      a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
      d = { "<cmd>Gist -d<cr>", "Delete" },
      f = { "<cmd>Gist -f<cr>", "Fork" },
      g = { "<cmd>Gist -b<cr>", "Create" },
      l = { "<cmd>Gist -l<cr>", "List" },
      p = { "<cmd>Gist -b -p<cr>", "Create Private" },
    },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>TroubleToggle<cr>", "Diagnostics" },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    o = { "<cmd>SymbolsOutline<cr>", "Outline" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },

  --[[ s = {
    name = "Surround",
    ["."] = { "<cmd>lua require('surround').repeat_last()<cr>", "Repeat" },
    a = { "<cmd>lua require('surround').surround_add(true)<cr>", "Add" },
    d = { "<cmd>lua require('surround').surround_delete()<cr>", "Delete" },
    r = { "<cmd>lua require('surround').surround_replace()<cr>", "Replace" },
    q = { "<cmd>lua require('surround').toggle_quotes()<cr>", "Quotes" },
    b = { "<cmd>lua require('surround').toggle_brackets()<cr>", "Brackets" },
  }, ]]

  S = {
    -- name = "Session",
    -- s = { "<cmd>SaveSession<cr>", "Save" },
    -- l = { "<cmd>LoadLastSession!<cr>", "Load Last" },
    -- d = { "<cmd>LoadCurrentDirSession!<cr>", "Load Last Dir" },
    -- f = { "<cmd>Telescope sessions save_current=false<cr>", "Find Session" },
    name = "SnipRun",
    c = { "<cmd>SnipClose<cr>", "Close" },
    f = { "<cmd>%SnipRun<cr>", "Run File" },
    i = { "<cmd>SnipInfo<cr>", "Info" },
    m = { "<cmd>SnipReplMemoryClean<cr>", "Mem Clean" },
    r = { "<cmd>SnipReset<cr>", "Reset" },
    t = { "<cmd>SnipRunToggle<cr>", "Toggle" },
    x = { "<cmd>SnipTerminate<cr>", "Terminate" },
  },

  t = {
    name = "Terminal",
    -- ["1"] = { ":1ToggleTerm<cr>", "1" },
    -- ["2"] = { ":2ToggleTerm<cr>", "2" },
    -- ["3"] = { ":3ToggleTerm<cr>", "3" },
    -- ["4"] = { ":4ToggleTerm<cr>", "4" },
    -- n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    -- u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    -- t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    -- p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    -- f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    -- h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    -- v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },

    -- If wintype is split/vsplit:
    ------ 'leftabove', 'aboveleft', 'rightbelow', 'belowright', 'topleft', 'botright'. Default: 'botright'.
    -- If wintype is float:
    ------ 'top', 'bottom', 'left', 'right', 'topleft', 'topright', 'bottomleft', 'bottomright', 'center',
    ------ 'auto'(at the cursor place). Default: 'center'
    n = {
      -- ":FloatermNew --width=0.8 --height=0.8 --wintype=float --name=Node --position=center --autoclose=1 node<CR>",
      "Node",
    },
    u = {
      -- ":FloatermNew --width=0.8 --height=0.8 --wintype=float --name=NCDU --position=center --autoclose=1 ncdu<CR>",
      "NCDU",
    },
    p = {
      -- ":FloatermNew --width=0.8 --height=0.8 --wintype=float --name=Python --position=center --autoclose=1 python<CR>",
      "Python",
    },
    t = {
      -- ":FloatermNew --width=0.8 --height=0.9 --wintype=float --name=Htop --position=center --autoclose=1 htop<CR>",
      "Htop",
    },
    c = {
      -- ":FloatermNew --width=0.8 --height=0.8 --wintype=float --name=Float --position=center --autoclose=1<CR>",
      "FloatermNew",
    },
    T = {
      -- ":FloatermToggle --width=0.8 --height=0.8 --wintype=float --name=Float --position=center --autoclose=1<CR>",
      -- ":FloatermToggle --autoclose=1<CR>",
      "Toggle|<M-f>",
    },
    h = {
      -- ":FloatermNew --width=0.4 --height=0.4 --wintype=split --name=Horizontal --position=botright --autoclose=1<CR>",
      "Horizontal",
    },
    v = {
      -- ":FloatermNew --width=0.4 --height=0.4 --wintype=vsplit --name=Vertical --position=botright --autoclose=1<CR>",
      "Vertical",
    },
  },

  T = {
    name = "Treesitter",
    h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
    p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
  },
  k = { "K", "keywordprg" },
  m = {
    name = "Markdown",
    p = { ":MarkdownPreview<CR>", "MarkdownPreview" },
    T = { ":MarkdownPreviewToggle<CR>", "MarkdownPreviewToggle" },
    s = { ":MarkdownPreviewStop<CR>", "MarkdownPreviewStop" },
    t = { "<cmd>TableModeToggle<CR>", "tab mode toggle" },
    r = { "<cmd>RenumberList<CR>", "RenumberList" },
    x = { "<cmd>ToggleCheckbox<CR>", "ToggleCheckbox" },
  },
  H = { "H", "original H" },
  L = { "L", "original L" },
  j = {
    name = "Hop jump",
    c = { ":HopChar1<CR>", "jump char1" },
    C = { ":HopChar2<CR>", "jump char2" },
    l = { ":HopLine<CR>", "jump line" },
    p = { ":HopPattern<cr>", "jump pattern" },
    w = { ":HopWord<CR>", "jump word" },
  },
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vmappings = {
  ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
  s = { "<esc><cmd>'<,'>SnipRun<cr>", "Run range" },
  m = {
    name = "Markdown",
    r = { "<cmd>RenumberSelection<CR>", "RenumberSelection" },
  },
  y = { "selected text in register" },
  Y = { "selected text in register" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(m_mappings, m_opts)
