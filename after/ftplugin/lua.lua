local curfile = vim.api.nvim_buf_get_name(0)

vim.keymap.set("n", "<leader>ft", function()
	vim.fn.system("stylua " .. curfile)
	vim.notify(curfile .. " formatted through stylua")
	vim.cmd(":e")
end, { desc = "Format current file" })
