return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls" },
      automatic_installation = true,
      handlers = {
        function(server_name)
          local capabilities = require("blink.cmp").get_lsp_capabilities()
          local on_attach_fn = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end

          local lspconfig = require("lspconfig")

          if server_name == "lua_ls" then
            print("[Mason] Setting up lua_ls with custom settings") -- ✅ Debug

            local util = require("lspconfig.util")

            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              on_attach = on_attach_fn,
              root_dir = function(fname)
                return util.find_git_ancestor(fname)
                  or util.path.dirname(fname)
              end,
              settings = {
                Lua = {
                  runtime = {
                    version = "LuaJIT",
                  },
                  diagnostics = {
                    globals = { "vim" },
                  },
                  workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                  },
                  telemetry = {
                    enable = false,
                  },
                },
              },
            })
          else
            lspconfig[server_name].setup({
              capabilities = capabilities,
              on_attach = on_attach_fn,
            })
          end
        end,
      },
    })

    vim.diagnostic.config({
      update_in_insert = true,
      virtual_text = true,
    })
  end,
}

