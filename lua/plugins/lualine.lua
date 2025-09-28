local function hide_in_width()
  return vim.fn.winwidth(0) > 80
end

local function active_clients()
  local clients = vim.lsp.get_clients()
  local buf_num = vim.api.nvim_get_current_buf()
  local client_names = {}

  for _, client in pairs(clients) do
    if client.attached_buffers and client.attached_buffers[buf_num] then
      table.insert(client_names, client.name)
    end
  end

  if #client_names > 0 then
    return table.concat(client_names, ", ")
  else
    return ""
  end
end
local language_server = {
  active_clients,
  cond = hide_in_width,
}

local lsp_progress = {
  "lsp_progress",
  display_components = { { "title", "percentage", "message" } },
  timer = {
    progress_enddelay = 500,
    lsp_client_name_enddelay = 500,
  },
}


local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = {
    error = " ",
    warn = "   ",
  },
  colored = true,
  padding = 0,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  cond = hide_in_width
}


local branch = {
  "b:gitsigns_head",
  icon = "",
  cond = hide_in_width
}

local filetype = {
  "filetype",
  icon_only = true,
  colored = false,
  cond = hide_in_width
}

local disable = {
  "neogitstatus",
  "netrw",
  "lir",
  "lazy",
  "alpha",
  "neo-tree",
  "Outline",
  "NeogitStatus",
  "NeogitCommitMessage"
}

local ignore = { "help", "packer", "spectre_panel", "TelescopePrompt" }

local opts = {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = " ",
    section_separators = { left = "", right = "" },
    disabled_filetypes = disable,
    ignore_focus = ignore,
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "filename", branch, diff },
    lualine_c = {},
    lualine_x = { lsp_progress, language_server, diagnostics },
    lualine_y = { filetype },
    lualine_z = { "location", "progress" },
  },
  inactive_sections = {
    lualine_a = { "mode" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location", "progress" },
  },
  extensions = { "oil" },
}


return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = opts,
    dependencies = {
      "arkav/lualine-lsp-progress",
    },
  },

}
