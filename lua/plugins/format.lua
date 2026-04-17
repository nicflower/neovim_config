return {
  "stevearc/conform.nvim",
  opts = {
    notify_on_error = true,
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 1500,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      elixir = { "mix" },
      elm = { "elm_format" },
      javascript = { "biome" },
      javascriptreact = { "biome" },
      lua = { "stylua" },
      rust = { "rustfmt" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
      zig = { "zigfmt" },
    },
  },
  keys = {
    {
      "<leader>f",
      function() require("conform").format() end,
      desc = "Format",
    },
  },
}
