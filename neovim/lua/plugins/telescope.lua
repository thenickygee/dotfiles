-- ==============================
--  Telescope Fuzzy Finder
-- ==============================

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  -- Telescope setup
  opts = {
    defaults = {
      file_ignore_patterns = { "%.git/", "%.next/", "node_modules/" },
    },
    pickers = {
      find_files = {
      hidden = true,
      no_ignore = true,
      },

      live_grep = {
        -- defaults
      },
    },
  },

  keys = {
    -- Your current mappings
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },

    -- “Show all files” variants that include dotfiles and bypass .gitignore
    {
      "<leader>fF",
      function()
        require("telescope.builtin").find_files({
          hidden = true,        -- include dotfiles like .env
          no_ignore = true,     -- ignore .gitignore/.ignore rules
        })
      end,
      desc = "Find files (all, incl. dotfiles)",
    },
    {
      "<leader>fG",
      function()
        require("telescope.builtin").live_grep({
          additional_args = function()
            return {
              "--hidden",        -- include dotfiles
              "--no-ignore",     -- bypass .gitignore/.ignore
              "--glob", "!**/.git/*", -- but don’t descend into .git
            }
          end,
        })
      end,
      desc = "Live grep (all, incl. dotfiles)",
    },
  },
}
