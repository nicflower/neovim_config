local curfile = vim.api.nvim_buf_get_name(0)

vim.keymap.set("n", "<leader>ft", function()
	vim.fn.system("mix format " .. curfile)
	vim.notify(curfile .. " formatted through mix")
	vim.cmd(":e")
end, { desc = "Format current file" })
