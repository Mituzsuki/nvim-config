return {

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "csharp_ls", "powershell_es", "jedi_language_server", "eslint" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.html.setup({ capabilities = capabilities })
      lspconfig.tsserver.setup({ capabilities = capabilities })
      lspconfig.csharp_ls.setup({ capabilities = capabilities })
      lspconfig.powershell_es.setup({ capabilities = capabilities })
      lspconfig.python.setup({ capabilities = capabilities })

      vim.lsp.handlers["textDocument/publishDiagnostics"] =
          vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            virtual_text = {
              spacing = 5,
              severity_limit = "Warning",
            },
            update_in_insert = true,
          })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
