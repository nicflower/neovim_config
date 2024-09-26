return {
    {
      'echasnovski/mini.nvim',
      version = false,
      config = function()
          require('mini.animate').setup()
          require('mini.icons').setup()
          require('mini.notify').setup()
          require('mini.pairs').setup()
          require('mini.files').setup()
          require('mini.comment').setup()
          vim.keymap.set('n', '<leader>ex', function() MiniFiles.open() end, {})
      end,
    },
}
