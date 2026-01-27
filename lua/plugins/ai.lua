return {
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = 'gpt-4.1',       -- AI model to use
      temperature = 0.1,       -- Lower = focused, higher = creative
      window = {
        layout = 'vertical',   -- 'vertical', 'horizontal', 'float'
        width = 0.5,           -- 50% of screen width
      },
      auto_insert_mode = true, -- Enter insert mode when opening
    },
    config = function()
      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = 'copilot-*',
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
          vim.opt_local.conceallevel = 0
        end,
      })
      local copilot_chat = require("CopilotChat")
      vim.keymap.set("n", "<leader>cc", copilot_chat.toggle, { desc = "[S]earch [F]iles" })
    end


  }
}
