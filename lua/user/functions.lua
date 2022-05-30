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

function M.toggle_option(option)
  local value = not vim.api.nvim_get_option_value(option, {})
  vim.opt[option] = value
  vim.notify(option .. " set to " .. tostring(value))
end

function M.toggle_tabline()
  local value = vim.api.nvim_get_option_value("showtabline", {})

  if value == 2 then
    value = 0
  else
    value = 2
  end

  vim.opt.showtabline = value

  vim.notify("showtabline" .. " set to " .. tostring(value))
end

local diagnostics_active = true
function M.toggle_diagnostics()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end

function M.isempty(s)
  return s == nil or s == ""
end

function M.get_buf_option(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

function M.smart_quit()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
  if modified then
    vim.ui.input({
      prompt = "You have unsaved changes. Quit anyway? (y/n) ",
    }, function(input)
      if input == "y" then
        vim.cmd "q!"
      end
    end)
  else
    vim.cmd "q!"
  end
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
