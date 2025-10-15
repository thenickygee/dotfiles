-- ==============================
--  LSP Configuration (Neovim 0.11+)
-- ==============================

return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "eslint" },
        automatic_installation = true,
      })

      -- Capabilities (completion)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      pcall(function()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      end)

      -- LSP keymaps / on_attach
      local on_attach = function(_, bufnr)
        local map = vim.keymap.set
        local function n(lhs, rhs, desc)
          map("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
        end

        n("gd", vim.lsp.buf.definition, "Go to definition")
        n("gr", vim.lsp.buf.references, "Find references")
        n("K", vim.lsp.buf.hover, "Hover docs")
        n("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        n("<leader>ca", vim.lsp.buf.code_action, "Code action")
        n("[d", vim.diagnostic.goto_prev, "Prev diagnostic")
        n("]d", vim.diagnostic.goto_next, "Next diagnostic")
        n("<leader>fd", function()
          vim.lsp.buf.format({ async = true })
        end, "Format file")
      end

      -- Root-dir helper (avoids lspconfig; uses vim.fs)
      local function root_with(patterns)
        return function(fname)
          local start = vim.fs.dirname(fname)
          local found = vim.fs.find(patterns, { upward = true, path = start })[1]
          return found and vim.fs.dirname(found) or vim.loop.cwd()
        end
      end

      -- TypeScript / JavaScript / React (JSX/TSX)
      vim.lsp.config("ts_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          typescript = { inlayHints = { includeInlayParameterNameHints = "all" } },
          javascript = { inlayHints = { includeInlayParameterNameHints = "all" } },
        },
        root_dir = root_with({ "package.json", "tsconfig.json", ".git" }),
      })

      -- ESLint
      vim.lsp.config("eslint", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = { workingDirectory = { mode = "auto" } },
        root_dir = root_with({ "package.json", ".eslintrc", ".git" }),
      })

      -- Enable servers
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("eslint")
    end,
  },
}
