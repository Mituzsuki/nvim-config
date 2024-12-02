return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			highlight = { enable = true },
			autopairs = { enable = true },
			autotag = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"html",
				"typescript",
				"javascript",
			},
		},
		config = function()
			local config = require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"html",
					"typescript",
					"javascript",
					"jsdoc",
					"lua",
					"luap",
					"vim",
					"bash",
					"c_sharp",
          "tsx",
          "python",
				},
				highlight = { enabled = true },
				indent = { enabled = true },
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		config = function()
			local config = require("nvim-treesitter")
			config.setup({})
		end,
	},
}
