-- ==============================
--  Treesitter Syntax Highlighting
-- ==============================

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "json",
        "css",
        "html",
        "lua",
      },
    })
  end,
}
