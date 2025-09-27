return {
  {
    -- use :Git to call any git command from within nvim
    "tpope/vim-fugitive",
    config = function()
      vim.api.nvim_create_user_command('VG', 'vertical G', { desc = "Vertical Git status" })
      vim.api.nvim_create_user_command('VGlog', 'vertical G log', { desc = "Vertical Git log" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')
        -- Navigation
        vim.keymap.set("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, { desc = "Next git diff chunk" })

        vim.keymap.set("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, { desc = "Previous git diff chunk" })
      end,
    },
  },
}
