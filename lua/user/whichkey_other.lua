local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local s_opts = {
  mode = "n", -- NORMAL mode
  prefix = "s",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local s_mappings = {
  l = { ":set splitright<CR>:vnew<CR>", "Vertical splitright" },
  h = { ":set nosplitright<CR>:vnew<CR>", "Vertical splitleft" },
  j = { ":set splitright<CR>:new<CR>", "SplitBelow" },
  k = { ":set nosplitright<CR>:new<CR>", "SplitTop" },
  V = { "<C-W>t<C-w>H<C-W>l", "To vertical" },
  H = { "<C-W>t<C-w>K<C-W>j", "To horizontal" },
  o = { ":source %<CR>", "Source curfile" },
  c = { "Delete curBuffer" },
  -- Press to close the window below the current window
  q = { "<C-w>j:q<CR>", "Close window below" },
  r = {
    name = "rotate",
    h = { "<C-W>b<C-w>K", "Rotate up" },
    v = { "<C-W>b<C-w>H", "Rotate down" },
  },
  S = {
    name = "Session",
    s = { "<cmd>SaveSession<cr>", "Save session" },
    l = { "<cmd>LoadLastSession!<cr>", "Load Last" },
    d = { "<cmd>LoadCurrentDirSession!<cr>", "Load Last Dir" },
    f = { "<cmd>Telescope sessions save_current=false<cr>", "Find Session" },
  },
  T = {
    name = "tab",
    c = { ":tabedit<CR>", "New tab" },
    p = { ":-tabmove<CR>", "Move prev" },
    n = { ":+tabmove<CR>", "Move next" },
    f = { ":0tabmove<CR>", "Move first" },
    l = { ":$tabmove<CR>", "Move last" },
  },
  d = { "/\\v(<\\w+>)\\_s*<\\1><CR>", "Adjacent duplicate words" },
  b = { "<Plug>(open-url-search-baidu)", "Baidu search" },
  w = { "<Plug>(open-url-search-bing)", "Bing search" },
  B = { "<Plug>(open-url-browser)", "Open url" },
  W = { "<Plug>(open-url-search-wikipedia)", "Wikipedia search" },
  p = { '"+p', "system copyboard" },
  t = {
    name = "Translate",
    c = { "<Plug>Translate", "In cmdline" },
    f = { "<Plug>TranslateW", "In floaterm" },
    r = { "<Plug>TranslateR", "Replace with" },
    x = { "<Plug>TranslateX", "In clipboard" },
    T = { "<Plug>(open-url-search-translate)", "Baidu translate" },
  },
}

local s_vopts = {
  mode = "v", -- VISUAL mode
  prefix = "s",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local s_vmappings = {
  p = { '"+p', "system copyboard" },
  t = {
    name = "Translate",
    c = { "<Plug>TranslateV", "In_cmdline" },
    f = { "<Plug>TranslateWV", "In_floaterm" },
    r = { "<Plug>TranslateRV", "Replace with" },
  },
}

local g_opts = { -- comma
  mode = "n", -- Normal mode
  prefix = "g",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local g_mappings = {
  c = {
    name = "linewise comment",
    c = { "Current line" },
    o = { "Next line|insert mode" },
    O = { "Prev line|insert mode" },
    A = { "End of current line|insert mode" },
  },
  b = {
    name = "blockwise comments",
    c = { "Current line" },
  },
  -- buffer keymap , just hint
  D = { "Buffer declaration" },
  d = { "Buffer definition" },
  I = { "Buffer implementation" },
  r = { "Buffer references" },
  s = { "Buffer show diagnostic" },
  l = { "Buffer list diagnostics" },
  -- [","] = { "Buffer prev diagnostics" },
  -- [";"] = { "Buffer next diagnostics" },
}

local g_vopts = { -- comma
  mode = "v", -- VISUAL mode
  prefix = "g",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local g_vmappings = {
  c = { "region linewise comment" },
  b = { "region blockwise comment" },
}

local c_opts = {
  mode = "n", -- Normal mode
  prefix = "c",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local c_mappings = {
  s = { name = "Change surround" },
  S = { name = "Change indent surround" },
}

local d_opts = {
  mode = "n", -- Normal mode
  prefix = "d",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local d_mappings = {
  s = { name = "Delete surround" },
}

local y_opts = {
  mode = "n", -- Normal mode
  prefix = "y",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local y_mappings = {
  s = {
    name = "You surround",
    s = { "current line" },
    f = { "Insert fn_name('old_text')" },
    F = { "Insert fn_name( 'old_text' )" },
    ["<C-f>"] = { "(fn_name 'old_text' )" },
  },
  S = {
    name = "You indent surround",
    S = { "current line" },
  },
}

local backslash_opts = { -- comma
  mode = "n", -- VISUAL mode
  prefix = "\\",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = false, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local backslash_mappings = {
  S = {
    name = "Spell",
    c = { ":set spell!<CR>", "Spelling_check" },
    g = { "ea<C-x><C-s>", "Spell_suggestion" },
  },
  f = { ":set filetype=", "Set filetype" },
  -- need install figlet
  g = { ":r !figlet", "Get_picture" },
  s = { ":%s/\\v/g<left><left>", "Substitute" },
  w = { ":set wrap<CR>", "wrap" },
  W = { ":set nowrap<CR>", "nowrap" },
  c = {
    name = "Just_list_Ctrl_bindings",
    ["<C-p>"] = { "Telescope.find_files.dropdown" },
    ["<C-t>"] = { "Buf.document_symbol" },
    ["<C-z>"] = { "ZenMode" },
    ["<C-n>"] = { ":e ~/Notes/" },
    ["<C-i>"] = { "In_rename_buf_to_start" },
    ["<C-a>"] = { "In_rename_buf_to_end" },
    ["<C-e>"] = { "In_rename_buf_to_word_end" },
    ["<C-b>"] = { "In_rename_buf_to_word_start" },
    ["<C-c>"] = { "In_rename_buf_clear_line" },
    ["<C-u>"] = { "In_rename_buf_undo" },
    ["<C-r>"] = { "In_rename_buf_redo" },
    ["<C-\\>"] = { "FloatermToggle_&_in_term" },
  },
  a = {
    name = "Just_list_Alt_bindings",
    ["<A-n>"] = { "Illuminate.next_ref" },
    ["<A-p>"] = { "Illuminate.prev_ref" },
    ["<A-f>"] = { "In_translator_float_scroll_next" },
    ["<A-b>"] = { "In_translator_float_scroll_prev" },
    ["<A-r>"] = { "Ranger_toggle" },
    ["<t_A-r>"] = { "In_term_Ranger_toggle" },
    ["<t_A-s>"] = { "In_term_Ranger_resize" },
    ["<M-f>"] = { "FloatermNew" },
    ["<A-d>"] = { "FloatermNext_&_in_term" },
    ["<A-u>"] = { "FloatermPrev_&_in_term" },
  },
  F = {
    name = "Just_list_F1-F12",
    ["<F2>"] = { "Rename_in_n_i_mode" },
    ["<F4>"] = { "Telescope_resume" },
    ["<F5>"] = { "refresh screen" },
    ["<F6>"] = { "Telescope_commands" },
    ["<F7>"] = { "TSHighlightCapturesUnderCursor" },
    ["<F8>"] = { "TSPlaygroundToggle" },
    ["<F9>"] = { "Echo_hi<...>_trans<...>_lo..." },
  },
}

local backslash_vopts = {
  mode = "v", -- VISUAL mode
  prefix = "\\",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = false, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local backslash_vmappings = {
  s = { ":s/\\v/g<left><left>", "substitute" },
}

local L_bracket_vopts = {
  mode = "n", -- VISUAL mode
  prefix = "[",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local L_brackey_vmappings = {
  c = { "prev_start_change_diffs" },
  i = { "1st_line_contain_keyword_in_file" },
  I = { "all_lines_contain_keyword_in_file" },
  p = { "like p, adjust indent to curline" },
  S = { "like [s, but search backwards" },
  z = { "start of cur_open_fold" },
  d = { "Buffer prev diagnostics" },
}

local R_bracket_vopts = {
  mode = "n", -- VISUAL mode
  prefix = "]",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local R_brackey_vmappings = {
  c = { "next_start_change_diffs_after" },
  i = { "1st_line_contain_keyword_after" },
  I = { "all_lines_contain_keyword_after" },
  S = { "like ]s, stop at bad words" },
  z = { "end of cur_open_fold" },
  d = { "Buffer next diagnostics" },
}

-- which_key.setup(setup)
which_key.register(s_mappings, s_opts)
which_key.register(s_vmappings, s_vopts)
which_key.register(g_mappings, g_opts)
which_key.register(g_vmappings, g_vopts)
which_key.register(c_mappings, c_opts)
which_key.register(d_mappings, d_opts)
which_key.register(y_mappings, y_opts)
which_key.register(backslash_mappings, backslash_opts)
which_key.register(backslash_vmappings, backslash_vopts)
which_key.register(L_brackey_vmappings, L_bracket_vopts)
which_key.register(R_brackey_vmappings, R_bracket_vopts)
