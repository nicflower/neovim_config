return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({
      winopts = {
        split = "botright new"
      },
      grep = {
        rg_glob = true,
      },
      oldfiles = {
        cwd_only = true,
      }

    })
    vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>sg", fzf.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sr", fzf.live_grep, { desc = "[S]earch [R]esume" })
    vim.keymap.set("n", "<leader>s.", fzf.oldfiles, { desc = "[S]earch Recent Files" })
    vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "Search Recent Buffers" })
    vim.keymap.set("n", "<leader>/", fzf.blines, { desc = "[S]earch in cucrent Buffer" })
    vim.keymap.set("n", "<leader>sw", fzf.grep_cword, { desc = "[S]earch Current [W]ord" })
  end
}
