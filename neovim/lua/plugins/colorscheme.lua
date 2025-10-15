-- ==============================
--  Colorscheme (Kanagawa)
-- ==============================

return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("kanagawa").setup({})
    vim.cmd.colorscheme("kanagawa-wave")
  end,
}
