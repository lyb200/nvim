-- local status_ok, _ = pcall(require, "vim_floaterm")
-- if not status_ok then
--   print "vim_floaterm not exits"
--   return
-- end

-- vim.g.floaterm_width = 0.6
-- vim.g.floaterm_height = 0.6
-- vim.g.floaterm_height = 0.4
-- vim.g.floaterm_gitcommit = "floaterm"
-- vim.g.floaterm_autoinsert = 1
-- vim.g.floaterm_wintitle = 0
-- 0: Always do NOT close floaterm window
-- 1: Close window if the job exits normally, otherwise stay it with messages like [Process exited 101]
-- 2: Always close floaterm window
-- vim.g.floaterm_autoclose = 0
-- vim.g.floaterm_wintype = "split"
-- vim.g.floaterm_wintype = "float"
-- vim.g.floaterm_position = "botright"

local set_var = vim.api.nvim_set_var

set_var("floaterm_width", 0.6)
-- set_var("floaterm_height", 0.6)
set_var("floaterm_height", 0.4)
set_var("flogicalm_gitcommit", "floaterm")
set_var("floaterm_autoinsert", 1)
set_var("floaterm_wintitle", 0)
set_var("floaterm_autoclose", 0)
set_var("floaterm_wintype", "float")
set_var("floaterm_position", "botright")
