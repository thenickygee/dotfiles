-- ==============================
--  Neo-tree File Explorer
-- ==============================

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
        },
      },
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<space>"] = "none",
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
      },
    })

    -- Set up keybindings
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })
    vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus file explorer" })

    -- Auto-open Neo-tree on startup
    vim.api.nvim_create_autocmd("VimEnter", {
      group = vim.api.nvim_create_augroup("neotree_auto_open", { clear = true }),
      callback = function()
        vim.schedule(function()
          vim.cmd("Neotree show")
        end)
      end,
    })
  end,
}
