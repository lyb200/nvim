--
-- Bullets.vim
--
vim.g.bullets_enabled_file_types = {
  "markdown",
  "text",
  "gitcommit",
  "scratch",
}
-- 启用或禁用默认的key mapping
-- let g:bullets_set_mappings = 0 " default = 1
-- Add a leader key before default mappings:
-- let g:bullets_mapping_leader = '<M-b>'
-- Set <M-b> to the leader before all default mappings:
-- Example: renumbering becomes `<M-b>gN` instead of just `gN`
--
-- 映射
-- Insert new bullet in INSERT mode: <cr> (Return key)
-- Same as in case you want to unmap in INSERT mode (compatibility depends on your terminal emulator): <C-cr>
-- Insert new bullet in NORMAL mode: o
-- Renumber current visual selection: gN
-- Renumber entire bullet list containing the cursor in NORMAL mode: gN
-- Toggle a checkbox in NORMAL mode: <leader>x
-- Demote a bullet (indent it, decrease bullet level, and make it a child of the previous bullet):
--     NORMAL mode: >>
--     INSERT mode: <C-t>
--     VISUAL mode: >
-- Promote a bullet (unindent it and increase the bullet level):
--     NORMAL mode: <<
--     INSERT mode: <C-d>
--     VISUAL mode: >
