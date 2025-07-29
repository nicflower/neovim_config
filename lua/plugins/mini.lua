return {
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function()
            require("mini.animate").setup()
            local notify = require("mini.notify")
            notify.setup()
            vim.notify = notify.make_notify({
                ERROR = { duration = 15000 },
                WARN = { duration = 10000 },
                INFO = { duration = 5000 },
            })
            require("mini.files").setup()
            require("mini.comment").setup()
            vim.keymap.set("n", "<leader>ex", function()
                MiniFiles.open()
            end, {})
            require("mini.statusline").setup()
        end,
    },
}
