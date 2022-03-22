local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local c_opts = { -- comma
  mode = "n", -- Normal mode
  prefix = ",",
  buffer = 0, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local c_mappings = {
  [";"] = { "<Esc>/<++><CR>:nohlsearch<CR>c4l", "find->edit<++>" },
}

-- local c_vopts = { -- comma
--   mode = "v", -- VISUAL mode
--   prefix = ",",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = false, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }
--
-- local c_vmappings = {}
--
local c_iopts = { -- comma
  mode = "i", -- VISUAL mode
  prefix = ",",
  buffer = 0, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local c_imappings = {
  [";"] = { "<Esc>/<++><CR>:nohlsearch<CR>c4l", "edit <++>" },
  w = { "<Esc>/ <++><CR>:nohlsearch<CR>c5l", "edit  <++>" },
  l = { "--------<CR>", "line" },
  n = { "---<CR><CR>", "line" },
  b = { "**** <++><Esc>2F*i", "bold" },
  s = { "~~~~ <++><Esc>2F~i", "strike" },
  i = { "** <++><Esc>F*i", "italic" },
  d = { "`` <++><Esc>F`i", "line code" },
  c = { "```<CR><++><CR>```<CR><CR><++><Esc>4kA", "code block" },
  m = { "- [ ]", "mark" },
  p = { "![](<++>) <++><Esc>F[a", "picture" },
  a = { "[](<++>) <++><Esc>F[a", "link" },
  ["1"] = { "#<Space><CR><++><Esc>kA", "1 heading" },
  ["2"] = { "##<Space><CR><++><Esc>kA", "2 heading" },
  ["3"] = { "###<Space><CR><++><Esc>kA", "3 heading" },
  ["4"] = { "####<Space><CR><++><Esc>kA", "4 heading" },
}

-- which_key.setup(setup)
which_key.register(c_mappings, c_opts)
which_key.register(c_imappings, c_iopts)
