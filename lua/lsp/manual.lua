
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local capabilities = require("blink.cmp").get_lsp_capabilities()

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  root_dir = function(fname)
    return util.find_git_ancestor(fname) or util.path.dirname(fname)
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
