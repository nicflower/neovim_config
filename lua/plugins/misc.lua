local vimutils = require("vimutils")
return {
    -- fade unused pane
    { "TaDaa/vimade" },
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
                default_file_explorer = true,
                delete_to_trash = true,
                view_options = {
                    show_hidden = true,
                    natural_order = true,
                    is_always_hidden = function(name, _)
                        return name == ".." or name == ".git"
                    end
                },
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
    },
    -- ufo: folding
    {
        'kevinhwang91/nvim-ufo',
        dependencies = {
            'kevinhwang91/promise-async'
        },
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
            }
            local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
            for _, ls in ipairs(language_servers) do
                require('lspconfig')[ls].setup({
                    capabilities = capabilities
                    -- you can add other fields for setting up lsp server in this table
                })
            end
            require('ufo').setup()

            vim.keymap.set('n', 'zR', function() require('ufo').openAllFolds() end, { desc = 'Open all folds' })
            vim.keymap.set('n', 'zM', function() require('ufo').closeAllFolds() end, { desc = 'Close all folds' })
            vim.keymap.set('n', 'zK', function() require('ufo').peekFoldedLinesUnderCursor() end, { desc = 'Peek fold' })
            vim.keymap.set('n', 'zK', function() require('ufo').peekFoldedLinesUnderCursor() end, { desc = 'Peek fold' })
            vim.keymap.set('n', '[z', function() require('ufo').goPreviousClosedFold() end,
                { desc = 'Go to previous fold' })
            vim.keymap.set('n', ']z', function() require('ufo').goNextClosedFold() end, { desc = 'Go to next fold' })
        end

    }
}
