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
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = function(client)
							client.server_capabilities.documentFormattingProvider = false
							client.server_capabilities.documentRangeFormattingProvider = false
						end,
						settings = server_name == "lua_ls" and {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						} or nil,
					})
				end,
			},
		})

		vim.diagnostic.config({
			update_in_insert = true,
			virtual_text = true,
		})
	end,
}
