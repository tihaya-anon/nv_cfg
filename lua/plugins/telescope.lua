return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzy-native.nvim",
			build = "make",
			-- cond = function()
			-- 	return vim.fn.executable("make") == 1
			-- end,
		},
	},
	config = function()
		require("telescope").setup({
			extensions = {
				fzy_native = {
					override_generic_sorter = false,
					override_file_sorter = true,
				},
			},
		})

		pcall(require("telescope").load_extension, "fzy_native")
	end,
}
