local M = {}

vim.cmd [[
  function Test()
    %SnipRun
    call feedkeys("\<esc>`.")
  endfunction

  function TestI()
    let b:caret = winsaveview()
    %SnipRun
    call winrestview(b:caret)
  endfunction
]]

function M.sniprun_enable()
  vim.cmd [[
    %SnipRun

    augroup _sniprun
     autocmd!
     autocmd TextChanged * call Test()
     autocmd TextChangedI * call TestI()
    augroup end
  ]]
  vim.notify "Enabled SnipRun"
end

function M.disable_sniprun()
  M.remove_augroup "_sniprun"
  vim.cmd [[
    SnipClose
    SnipTerminate
    ]]
  vim.notify "Disabled SnipRun"
end

function M.toggle_sniprun()
  if vim.fn.exists "#_sniprun#TextChanged" == 0 then
    M.sniprun_enable()
  else
    M.disable_sniprun()
  end
end

function M.remove_augroup(name)
  if vim.fn.exists("#" .. name) == 1 then
    vim.cmd("au! " .. name)
  end
end

vim.cmd [[ command! SnipRunToggle execute 'lua require("user.functions").toggle_sniprun()' ]]

-- get length of current word
function M.get_word_length()
  local word = vim.fn.expand "<cword>"
  return #word
end

-- some my found function
M.get_selection = function()
  local f = vim.fn
  local temp = f.getreg "s"
  vim.cmd 'normal! gv"sy'

  f.setreg("/", f.escape(f.getreg "s", "/"):gsub("\n", "\\n"))

  f.setreg("s", temp)
end

M.trailspace_trim = function()
  -- Save cursor position to later restore
  local curpos = vim.api.nvim_win_get_cursor(0)

  -- Search and replace trailing whitespace
  vim.cmd [[keeppatterns %s/\s\+$//e]]
  vim.api.nvim_win_set_cursor(0, curpos)
end

M.edit_macro = function()
  local register = "i"

  local opts = { default = vim.g.edit_macro_last or "" }

  if opts.default == "" then
    opts.prompt = "Create Macro"
  else
    opts.prompt = "Edit Macro"
  end

  vim.ui.input(opts, function(value)
    if value == nil then
      return
    end

    local macro = vim.fn.escape(value, '"')
    vim.cmd(string.format('let @%s="%s"', register, macro))

    vim.g.edit_macro_last = value
  end)
end

M.CompileRunGcc = function()
  local filetype = vim.bo.filetype

  vim.cmd [[ exec "w" ]]

  if filetype == "c" then
    vim.cmd [[ exec "!g++ % -o %<" ]]
    vim.cmd [[ exec "!time ./%<" ]]
  elseif filetype == "cpp" then
    vim.cmd [[exec "!g++ -std=c++11 % -Wall -o %<" ]]
    vim.cmd [[ FloatermNew --height=0.4 --wintype=split --position=botright ./%< ]]
  elseif filetype == "java" then
    vim.cmd [[ exec "!javac %" ]]
    vim.cmd [[exec "!time java %<" ]]
  elseif filetype == "sh" then
    vim.cmd [[ !time bash % ]]
  elseif filetype == "python" then
    vim.cmd [[ FloatermNew --height=0.4 --wintype=split --position=botright python % ]]
  elseif filetype == "html" then
    vim.cmd [[silent! exec "!" . g:mkdp_browser . " % &" ]]
  elseif filetype == "markdown" then
    vim.cmd [[ exec "MarkdownPreview" ]]
  elseif filetype == "tex" then
    vim.cmd [[
      silent! exec "VimtexStop"
      silent! exec "VimtexCompile"
    ]]
  elseif filetype == "dart" then
    -- can't execute, No CocCommand, here
    vim.cmd [[
      exec "CocCommand flutter.run -d " . g:flutter_default_device . " " . g:flutter_run_args
      silent! exec "CocCommand flutter.dev.openDevLog"
    ]]
  elseif filetype == "javascript" then
    vim.cmd [[
      FloatermNew --height=0.4 --wintype=split --position=botright export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    ]]
  elseif filetype == "go" then
    vim.cmd [[ FloatermNew --height=0.4 --wintype=split --position=botright go run . ]]
  elseif filetype == "lua" then
    vim.cmd [[ FloatermNew --height=0.4 --wintype=split --position=botright lua % ]]
  end
end

return M
