return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function()
      vim.cmd.colorscheme('kanagawa')
    end
  },
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
  }
}
