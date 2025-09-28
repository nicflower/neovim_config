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
      vim.keymap.set("n", "<leader>ew", function() require("oil").open(vim.fn.getcwd(), nil, nil) end,
        { desc = "Open Oil in current directory" })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,

  },
  {
  'maan2003/lsp_lines.nvim',
  config = function()
    require("lsp_lines").setup()
    vim.keymap.set("n", "<leader>ll", require("lsp_lines").toggle, { desc = "LSP: Toggle lsp lines" })
  end
  }

}
