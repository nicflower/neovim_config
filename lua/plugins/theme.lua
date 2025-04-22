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
          vim.cmd.colorscheme('no-clown-fiesta')
      end,
      lazy = false,
    }
}
