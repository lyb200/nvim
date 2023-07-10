-- registe comma_which_key function
_G.comma_which_key = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local bufnr = vim.fn.bufnr(vim.fn.bufname "%")

  local c_opts = { -- comma
    mode = "n", -- Normal mode
    prefix = ",",
    buffer = bufnr, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  local c_mappings = {
    [";"] = { '<Esc>/<++><CR>:nohlsearch<CR>"_c4l', "find->edit<++>" },
  }

  local c_iopts = { -- comma
    mode = "i", -- Insert mode
    prefix = ",",
    buffer = bufnr, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  local c_imappings = {
    [";"] = { '<Esc>/<++><CR>:nohlsearch<CR>"_c4l', "/<++> insert" },
    ["/"] = { '<Esc>/ <++><CR>:nohlsearch<CR>"_c5l', "/  <++> insert" },
    [" "] = { ', ', "do nothing" },
    l = { "--------<CR>", "line ------" },
    n = { "---<CR><CR>", "line ---<CR><CR>" },
    o = { "**** <++><Esc>2F*i", "bold ****" },
    s = { "~~~~ <++><Esc>2F~i", "strike ~~~~" },
    i = { "** <++><Esc>F*i", "italic **" },
    c = { "`` <++><Esc>F`i", "Inline code ``" },
    b = { "```<CR><++><CR>```<CR><CR><++><Esc>4kA", "block code ``````" },
    T = { "- [ ] ", "TODO - [ ]" },
    D = { "- [x] ", "Done - [x]" },
    P = { "![](<++>) <++><Esc>F[a", "picture ![](<++>)" },
    p = { "<div align='center'><img src='../img/' alt='<++>' width='<++>' height='<++>'></div><Esc>Fa3h", "picture center" },
    e = { "<p align='center'></p><Esc>F<h", "text center" },
    E = { "<div align='center'><font size='7'></font></div><Esc>2F<i", "Head center" },
    a = { "[](<++>) <++><Esc>F[a", "link [](<++>" },
    m = { "@[TOC](目录) <++><Esc>F(a", "Menu [TOC]" },
    ["1"] = { "#<Space><CR><CR><++><Esc>2kA", "heading1" },
    ["2"] = { "##<Space><CR><CR><++><Esc>2kA", "heading2" },
    ["3"] = { "###<Space><CR><CR><++><Esc>2kA", "heading3" },
    ["4"] = { "####<Space><CR><CR><++><Esc>2kA", "heading4" },
    ["5"] = { "#####<Space><CR><CR><++><Esc>2kA", "heading5" },
    ["6"] = { "######<Space><CR><CR><++><Esc>2kA", "heading6" },
    t = {
      ["2"] = { "| <++> | <center><++></center> |<CR>| ---  | :---  |<CR>| <++> | <++> |<ESC>yy10p3k", "table 2 cols"},
      ["3"] = { "| <++> | <++> | <++> |<CR>| ---  | ---  | ---  |<CR>| <++> | <++> | <++> |<ESC>yy10p3k", "table 3 cols"},
      ["4"] = { "| <++> | <++> | <++> | <++> |<CR>| ---  | ---  | ---  | ---  |<CR>| <++> | <++> | <++> | <++> |<ESC>yy10p3k", "table 4 cols"},
      ["5"] = { "| <++> | <++> | <++> | <++> | <++> |<CR>| ---  | ---  | ---  | ---  | ---  |<CR>| <++> | <++> | <++> | <++> | <++> |<ESC>yy10p3k", "table 5 cols"},
      ["6"] = { "| <++> | <++> | <++> | <++> | <++> | <++> |<CR>| ---  | ---  | ---  | ---  | ---  | ---  |<CR>| <++> | <++> | <++> | <++> | <++> | <++> |<ESC>yy10p3k", "table 6 cols"},
    },
    h = { "<++>", "placeholder"},
  }

  which_key.register(c_mappings, c_opts)
  which_key.register(c_imappings, c_iopts)
end

-- local c_vopts = { -- comma
--   mode = "v", -- VISUAL mode
--   prefix = ",",
--   buffer = bufnr, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = false, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }
--
-- local c_vmappings = {}
--
