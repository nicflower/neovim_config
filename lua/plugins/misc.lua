return {
    { "TaDaa/vimade" },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>un", vim.cmd.UndotreeToggle)
        end,
    },
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        }
    }
}
