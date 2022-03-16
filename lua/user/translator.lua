local status_ok, translator = pcall(require, "translator")
if not status_ok then
	return
end

local opts = { noremap = true, silent = true, expr = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- 一旦翻译窗口打开，<C-w>p to jump into it and again to jump back
-- 有一个函数可以滚动窗口 only works in neovim.
vim.cmd[[
  nnoremap <silent><expr> <M-f> translator#window#float#has_scroll() ? translator#window#float#scroll(1) : "\<M-f>"
  nnoremap <silent><expr> <M-b> translator#window#float#has_scroll() ? translator#window#float#scroll(0) : "\<M-f>"
]]
-- keymap('n', '<M-f>, 'translator#window#float#has_scroll() ? translator#window#float#scroll(1) : "\\<M-f>"', opts)
-- keymap('n', '<M-b>, 'translator#window#float#has_scroll() ? translator#window#float#scroll(0) : "\\<M-f>"', opts)
