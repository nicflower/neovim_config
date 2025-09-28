local vimutils = require "vimutils"
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
-- vim options
vim.g.mapleader = " "
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.expandtab = true --turn tabs to spaces
vim.opt.tabstop = 4      --1 tab = 4 spaces
vim.opt.shiftwidth = 4
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.clipboard = vim.o.clipboard .. 'unnamed,unnamedplus'
vim.opt.ignorecase = true
vim.opt.termguicolors = true

vim.opt.spell = true
vim.opt.spelllang = "en_us"

vim.opt.cursorline = true

-- disable opening new window when saving with errors zig files
vim.g.zig_fmt_parse_errors = 0

-- setup folding (also look at the ufo plugin)
vim.opt.foldlevel = 99 
vim.opt.foldlevelstart =  99
vim.opt.foldcolumn = "1"
vim.opt.foldenable = true
vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:'

function buf_path_to_clipboard()
  local filepath = vimutils.cur_file()
  vim.fn.setreg('+', filepath) -- write to clipboard
  vim.notify("current file path copied to clipboard")
end

vim.keymap.set('n', '<leader>pc', buf_path_to_clipboard,
  { noremap = true, silent = true, desc = "Copy path of the current buffer to clipboard" })

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
  end,
})
--
-- LSP stuff
vim.opt.completeopt = "menu,popup,fuzzy,noselect,noinsert,preview"
vim.lsp.enable({ 'expert' })
vim.lsp.enable({ 'lua_ls' })
vim.lsp.enable({ 'elmls' })
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end

    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

-- redirects the output of a command to a temporary buffer
vim.api.nvim_create_user_command('Redir', function(ctx)
  local lines = vim.split(vim.api.nvim_exec(ctx.args, true), '\n', { plain = true })
  vim.cmd('new')
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.opt_local.modified = false
end, { nargs = '+', complete = 'command' })

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})
