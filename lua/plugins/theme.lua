--[[return {
    "fcancelinha/nordern.nvim",
    branch = "master",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme('nordern')
    end,
}]]
--
return {
    {
        "aktersnurra/no-clown-fiesta.nvim",
        priority = 1000,
        config = function()
            local opts = {
                transparent = true,
                styles = {
                    type = { bold = true },
                    lsp = { underline = false },
                    match_paren = { underline = true },
                },
            }
            local plugin = require "no-clown-fiesta"
            plugin.setup(opts)
        end,
        lazy = false,
    },
    {
        "webhooked/kanso.nvim",
        config = function()
            local opts = {
                theme = "zen"
            }
            require("kanso").setup(opts)
            vim.cmd.colorscheme('kanso')
        end,
        lazy = false,
        priority = 1000,
    }
}
