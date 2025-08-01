local vimutils = require("vimutils")
return {
    -- fade unused pane
    { "TaDaa/vimade" },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>un", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
        end,
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
    {
        'stevearc/oil.nvim',
        config = function()
            require("oil").setup({
                view_options = {
                    show_hidden = true
                }

            })

            vim.keymap.set("n", "<leader>ex", function() require("oil").open(nil, nil, nil) end,
                { desc = "Open Oil" })
            vim.keymap.set("n", "<leader>exf", function() require("oil").open_float(nil, nil, nil) end,
                { desc = "Open Oil" })
            -- open oil in the parent directory of the file opened in the current buffer
            vim.keymap.set("n", "<leader>ec", function() require("oil").open(vimutils.cur_dir(), nil, nil) end,
                { desc = "Open Oil in current directory" })
        end,
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    }

}
