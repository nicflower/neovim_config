return {
    -- fade unused pane
    { "TaDaa/vimade" },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>un", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
        end,
    },
    -- markdown files preview inside nvim
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix"
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
}
