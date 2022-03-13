local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end
hop.setup()
-- vim.api.nvim_set_keymap("", "s", ":HopChar2<cr>", { silent = true })
-- vim.api.nvim_set_keymap("", "S", ":HopWord<cr>", { silent = true })
-- vim.api.nvim_set_keymap("n", ",j2", ":HopChar2<cr>", { silent = true })
vim.api.nvim_set_keymap("n", ",w", ":HopWord<cr>", { silent = true })
vim.api.nvim_set_keymap("n", ",p", ":HopPattern<cr>", {})
vim.api.nvim_set_keymap("n", ",l", ":HopLine<cr>", { silent = true })

-- plugin recommended
vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
