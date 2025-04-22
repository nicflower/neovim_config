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
      opts = {
          transparent = true
      },
      config = function()
        vim.cmd.colorscheme('no-clown-fiesta')
      end,
      lazy = false,
    }
}
