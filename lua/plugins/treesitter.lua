return {
	{
		"windwp/nvim-ts-autotag",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
    opts = {
      highlight = { enable = true},
      autopairs = { enable = true},
      autotag = { enable = true},
      indent = { enable = true},
      ensure_installed = {
        "typescript",
        "javascript"
      }
    },
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = { enabled = true },
				highlight = { enabled = true },
				indent = { enabled = true },
				autotag = {
					enable = true,
					filetypes = { "html", "ts", "tsx" },
				},
			})
		end,
	},
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      local config = require("nvim-treesitter")
      config.setup({})
    end
  },
}
