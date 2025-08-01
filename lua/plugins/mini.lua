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
            require("mini.comment").setup()
            require("mini.statusline").setup()
        end,
    },
}
