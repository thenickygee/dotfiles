-- ==============================
--  Harpoon File Navigation
-- ==============================

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- Keymaps
    local map = vim.keymap.set
    map("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "Harpoon add file" })
    map("n", "<leader>hh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon quick menu" })

    -- Navigate to harpooned files
    map("n", "<C-h>", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon file 1" })
    map("n", "<C-t>", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon file 2" })
    map("n", "<C-n>", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon file 3" })
    map("n", "<C-s>", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon file 4" })

    -- Toggle previous & next buffers
    map("n", "<C-S-P>", function()
      harpoon:list():prev()
    end, { desc = "Harpoon prev" })
    map("n", "<C-S-N>", function()
      harpoon:list():next()
    end, { desc = "Harpoon next" })
  end,
}
