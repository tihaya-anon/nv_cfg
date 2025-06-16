return {
	"nvimdev/lspsaga.nvim",
	cmd = "Lspsaga",
	opts = {},
	keys = {
		{ "<leader>lr", ":Lspsaga rename<CR>" },
		{ "<leader>lc", ":Lspsaga code_action<CR>" },
		{ "<leader>ld", ":Lspsaga definition<CR>" },
		{ "<leader>lh", ":Lspsaga hover_doc<CR>" },
		{ "<leader>lR", ":Lspsaga finder<CR>" },
		{ "<leader>ln", ":Lspsaga diagnostic_jump_next<CR>" },
		{ "<leader>lp", ":Lspsaga diagnostic_jump_prev<CR>" },
	},
}
