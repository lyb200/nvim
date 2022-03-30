---
# Neovim API aliases -- some code
---

```lua
local cmd = vim.cmd -- Execute Vim commands
local exec = vim.api.nvim_exec -- Execute Vimscript
local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)
local fn = vim.fn -- Call Vim functions
```

---

## some useful code

```
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
```

the basics: setting options
Vim has 3 kinds of options — global, buffer-local and window-local. In Vimscript, you’d just set these. In Lua, however, you will have to use one of

```
vim.api.nvim_set_option() — global options
vim.api.nvim_buf_set_option() — buffer-local options
vim.api.nvim_win_set_option() — window-local options
```

These are fairly verbose and very clunky, but fortunately for us, we have “meta-accesors” for these: vim.{o,wo,bo}. Here’s an excerpt from my settings.lua as an example:

```
local o = vim.o
local wo = vim.wo
local bo = vim.bo
```

vim-zoom has a variable called zoom#statustext and in vimscript we use it like this.

```
let g:zoom#statustext = 'Z'
```

In lua we would have to do this.

```
vim.g['zoom#statustext'] = 'Z'
```

Gets or sets environment variables.

```
vim.env.FZF_DEFAULT_OPTS = '--layout=reverse'
```

Anyway, what about global variables or the environment variables? For those you should keep using `vim.g` and `vim.env` respectively

```
print(vim.opt.autoindent:get())
```

If you really, really want to know what's inside vim.out.autoindent you need to use vim.inspect.

```
print(vim.inspect(vim.opt.autoindent))
vim.opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}
```

```
if vim.fn.has('nvim-0.5') == 1 then
  print('we got neovim 0.5')
end
```

I've already mentioned that vimscript can have variable names that are not valid in lua, in that case you know you can use square brackets like this.

```
vim.fn['fzf#vim#files']('~/projects', false)
```

Another way we can solve this is by using vim.call.

```
vim.call('fzf#vim#files', '~/projects', false)
```

Those two do the exact same thing. In practice vim.fn.somefunction() and vim.call('somefunction') have the same effect.

## Vimscript is still our friend

You might have notice in that last example I used vim.cmd to set the color scheme, this is because there are still things we can't do with lua. Right now we can't create or call ex-commands, same goes for autocommands.

## Calling lua functions

If we apply the knowledge we gained already about calling lua from vimscript, then we can do this.
Assuming we have a lua module called usermod and this module has a function called somefunction.

```
local M = {}

M.somefunction = function()
  print('all good')
end

return M
```

We can call it like this.

```
vim.api.nvim_set_keymap(
  'n',
  '<Leader>w',
  "<cmd>lua require('usermod').somefunction()<CR>",
  {noremap = true}
)
```

Now, things change a little bit if we need an expression. In that case we can't use <cmd>lua. We would need the variable v:lua, with this variable we can call lua functions that exists in the global scope.
To show you how this would work I'll try to make a smart <Tab> key. When the autocomplete menu is visible I want to navigate throught the list of results, otherwise it'll act like a regular <Tab>.

```
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.smart_tab = function()
  if vim.fn.pumvisible() == 1 then
    return t'<C-n>'
  else
    return t'<Tab>'
  end
end

vim.api.nvim_set_keymap(
  'i',
  '<Tab>',
  'v:lua.smart_tab()',
  {noremap = true, expr = true}
)
```

### maybe not needed

vim.cmd [[if has('win32')
     silent !mkdir $HOME/AppData/Local/nvim-data/backup
     silent !mkdir $HOME/AppData/Local/nvim-data/undo
     silent !mkdir $HOME/AppData/Local/nvim-data/view
   else
     silent !mkdir -p $HOME/tmp/backup
     silent !mkdir -p $HOME/tmp/undo
     silent !mkdir -p $HOME/tmp/view
   endif]]

if has "win32" then
opt.backupdir = "$HOME/AppData/Local/nvim-data/backup"
 else
   opt.backupdir = "$HOME/tmp/backup"
end

if has "mksession" then
opt.viewdir = "$HOME/AppData/Local/nvim-data/view"
 else
   opt.viewdir = "$HOME/tmp/backup"
end

if has "persistent_undo" then
if has "unix" then
opt.undodir = "$HOME/tmp/undo"
   else
     opt.undodir = "$HOME/AppData/Local/nvim-data/undo"
end
end

```vim
vim.cmd [[--   func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
      exec "!g++ % -o %<"
      exec "!time ./%<"
    elseif &filetype == 'cpp'
      exec "!g++ -std=c++11 % -Wall -o %<"
      :FloatermNew --height=0.4 --wintype=split --position=botright ./%<
      " set splitbelow
      " :spilt
      " :resize -15
      " :term ./%<
    elseif &filetype == 'java'
      exec "!javac %"
      exec "!time java %<"
    elseif &filetype == 'sh'
      :!time bash %
    elseif &filetype == 'python'
      :FloatermNew --height=0.4 --wintype=split --position=botright python %
      " set splitbelow
      " :sp
      " :term python %
    elseif &filetype == 'html'
      silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'markdown'
      exec ":MarkdownPreview"
    elseif &filetype == 'tex'
      silent! exec "VimtexStop"
      silent! exec "VimtexCompile"
    elseif &filetype == 'dart'
      exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
      silent! exec "CocCommand flutter.dev.openDevLog"
    elseif &filetype == 'javascript'
      :FloatermNew --height=0.4 --wintype=split --position=botright export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
      " set splitbelow
      " :sp
      " :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'go'
      :FloatermNew --height=0.4 --wintype=split --position=botright go run .
      " set splitbelow
      " :sp
      " :term go run .
    elseif &filetype == 'lua'
      if has('unix')
        :FloatermNew --height=0.4 --wintype=split --position=botright lua %
      else
        :FloatermNew --height=0.4 --wintype=split --position=botright c:\lua_bin/lua54 %
      endif
    endif
  endfunc
]]
```
