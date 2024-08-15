return {
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"filipdutescu/renamer.nvim",
		config = function()
      require('renamer').setup()
			vim.keymap.set("i", "<F2>", '<CMD>lua require("renamer").rename()<CR>', { noremap = true, silent = true })
		end,
	},
}
