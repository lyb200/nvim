local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

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
  [","] = { "Buffer prev diagnostics" },
  [";"] = { "Buffer next diagnostics" },
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

--------------------------------------------------
-- buffer which_key config may not work
--------------------------------------------------
-- local g_buf_opts = { -- comma
--   mode = "n", -- Normal mode
--   prefix = "g",
--   buffer = 0, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }
-- local g_buf_mappings = {
--   D = { "declaration" },
--   d = { "definition" },
--   I = { "implementation" },
--   r = { "references" },
--   s = { "Open diagnostic" },
--   l = { "list diagnostic" },
-- [","] = { "Buffer prev diagnostics" },
-- [";"] = { "Buffer next diagnostics" },
-- }
--
-- local buf_opts = { -- buf <leader>
--   mode = "n",
--   prefix = "<leader>",
--   buffer = 0, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }
-- local buf_mappings = {
--   ["<"] = { "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", "Prev_diagnostic" },
--   [">"] = { "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", "Next_diagnostic" },
--   -- ["q"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "diagnostic_local_list" },
-- }
--------------------------------------------------
-- buffer which_key config may not work
--------------------------------------------------

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

-- which_key.setup(setup)
which_key.register(g_mappings, g_opts)
which_key.register(g_vmappings, g_vopts)
which_key.register(c_mappings, c_opts)
which_key.register(d_mappings, d_opts)
which_key.register(y_mappings, y_opts)
-- which_key.register(g_buf_mappings, g_buf_opts)
-- which_key.register(buf_mappings, buf_opts)
