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
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.termguicolors = true
-- disable opening new window when saving with errors zig files
vim.g.zig_fmt_parse_errors = 0

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
})
