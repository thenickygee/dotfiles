-- ==============================
--  Lazy.nvim Bootstrap
-- ==============================

-- Guard for Neovim 0.11+
if not (vim and vim.lsp and vim.lsp.config and vim.lsp.enable) then
  vim.schedule(function()
    vim.api.nvim_echo({
      { "This config requires Neovim 0.11+ for vim.lsp.config/vim.lsp.enable.\n", "ErrorMsg" },
      { "Please upgrade Neovim or switch to a legacy config.\n", "WarningMsg" },
    }, true, {})
  end)
end

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim to auto-load plugins from lua/plugins/
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
})
