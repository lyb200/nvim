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

-- which_key.setup(setup)
which_key.register(g_mappings, g_opts)
which_key.register(g_vmappings, g_vopts)
which_key.register(c_mappings, c_opts)
which_key.register(d_mappings, d_opts)
which_key.register(y_mappings, y_opts)
