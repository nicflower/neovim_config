local vimutils = require "vimutils"
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)
-- vim options
vim.g.mapleader = " "
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.expandtab = true --turn tabs to spaces
vim.opt.tabstop = 4      --1 tab = 4 spaces
vim.opt.shiftwidth = 4
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.clipboard = vim.o.clipboard .. 'unnamed,unnamedplus'
vim.opt.ignorecase = true
vim.opt.termguicolors = true

vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- disable opening new window when saving with errors zig files
vim.g.zig_fmt_parse_errors = 0

-- setup folding (also look at the ufo plugin)
vim.opt.foldlevel = 99 
vim.opt.foldlevelstart =  99
vim.opt.foldcolumn = "1"
vim.opt.foldenable = true
vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:'

function buf_path_to_clipboard()
    local filepath = vimutils.cur_file()
    vim.fn.setreg('+', filepath) -- write to clipboard
    vim.notify("current file path copied to clipboard")
end

vim.keymap.set('n', '<leader>pc', buf_path_to_clipboard,
    { noremap = true, silent = true, desc = "Copy path of the current buffer to clipboard" })

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})
-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
})
