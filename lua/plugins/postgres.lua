return {
	"guysherman/pg.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"guysherman/pg.nvim",
	},
  config = function()
    vim.keymap.set('n', '<leader>qq', ':<c-u>exec "PGRunQuery"<cr>')
    vim.keymap.set('n', '<leader>qc', ':PGConnectBuffer<cr>')
  end
}
