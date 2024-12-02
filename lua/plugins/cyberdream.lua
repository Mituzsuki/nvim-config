return {
	"scottmckendry/cyberdream.nvim",
	name = "cyberdream",
	priority = 1002,
	config = function()
		vim.cmd.colorscheme("cyberdream")
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "grey" })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "orange" })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "grey" })
	end,
}
