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
    a = { "[](<++>) <++><Esc>F[a", "link [](<++>" },
    b = { "```<CR><++><CR>```<CR><CR><++><Esc>4kA", "block code ``````" },
    c = { "`` <++><Esc>F`i", "Inline code ``" },
    D = { "- [x] ", "Done - [x]" },
    e = { "<p align='center'></p><Esc>F<h", "text center" },
    E = { "<div align='center'><font size='7'></font></div><Esc>2F<i", "Head center" },
    h = { "<++>", "placeholder"},
    i = { "** <++><Esc>F*i", "italic **" },
    l = { "--------<CR>", "line ------" },
    m = { "@[TOC](目录) <++><Esc>F(a", "Menu [TOC]" },
    n = { "---<CR><CR>", "line ---<CR><CR>" },
    o = { "**** <++><Esc>2F*i", "bold ****" },
    P = { "![](<++>) <++><Esc>F[a", "picture ![](<++>)" },
    p = { "<div align='center'><img src='../img/' alt='<++>' width='<++>' height='<++>'></div><Esc>Fa3h", "picture center" },
    s = { "~~~~ <++><Esc>2F~i", "strike ~~~~" },
    T = { "- [ ] ", "TODO - [ ]" },
    ["1"] = { "#<Space><CR><CR><++><Esc>2kA", "heading1" },
    ["2"] = { "##<Space><CR><CR><++><Esc>2kA", "heading2" },
    ["3"] = { "###<Space><CR><CR><++><Esc>2kA", "heading3" },
    ["4"] = { "####<Space><CR><CR><++><Esc>2kA", "heading4" },
    ["5"] = { "#####<Space><CR><CR><++><Esc>2kA", "heading5" },
    ["6"] = { "######<Space><CR><CR><++><Esc>2kA", "heading6" },
    t = {
      name = "table",
      ["2"] = { "| <++> | <center><++></center> |<CR>| ---  | :---  |<CR>| <++> | <++> |<ESC>yy10p3k", "table 2 cols"},
      ["3"] = { "| <++> | <++> | <++> |<CR>| ---  | ---  | ---  |<CR>| <++> | <++> | <++> |<ESC>yy10p3k", "table 3 cols"},
      ["4"] = { "| <++> | <++> | <++> | <++> |<CR>| ---  | ---  | ---  | ---  |<CR>| <++> | <++> | <++> | <++> |<ESC>yy10p3k", "table 4 cols"},
      ["5"] = { "| <++> | <++> | <++> | <++> | <++> |<CR>| ---  | ---  | ---  | ---  | ---  |<CR>| <++> | <++> | <++> | <++> | <++> |<ESC>yy10p3k", "table 5 cols"},
      ["6"] = { "| <++> | <++> | <++> | <++> | <++> | <++> |<CR>| ---  | ---  | ---  | ---  | ---  | ---  |<CR>| <++> | <++> | <++> | <++> | <++> | <++> |<ESC>yy10p3k", "table 6 cols"},
    },
    C = {
      name = "color",
      r = {"$\\color{red}{}$<Esc>2h", "color red"},
      b = {"$\\color{blue}{}$<Esc>2h", "color blue"},
      g = {"$\\color{green}{}$<Esc>2h", "color green"},
      B = {"$\\color{black}{}$<Esc>2h", "color black"},
      G = {"$\\color{gray}{}$<Esc>2h", "color gray"},
      s = {"$\\color{silver}{}$<Esc>2h", "color silver"},
      w = {"$\\color{whte}{}$<Esc>2h", "color whte"},
      m = {"$\\color{maroon}{}$<Esc>2h", "color maroon，褐红色"},
      y = {"$\\color{yellow}{}$<Esc>2h", "color yellow"},
      l = {"$\\color{lime}{}$<Esc>2h", "color lime,绿黄色"},
      o = {"$\\color{olive}{}$<Esc>2h", "color olive,淡褐色,橄榄绿"},
      t = {"$\\color{teal}{}$<Esc>2h", "color teal,青色"},
      a = {"$\\color{aqua}{}$<Esc>2h", "color aqua,浅绿色"},
      n = {"$\\color{navy}{}$<Esc>2h", "color navy,深蓝色"},
      p = {"$\\color{purple}{}$<Esc>2h", "color purple,紫色"},
      f = {"$\\color{fuchsia}{}$<Esc>2h", "color fuchsia,紫红色"},
    },
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
