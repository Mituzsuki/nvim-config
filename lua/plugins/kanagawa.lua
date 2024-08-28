return {
	"rebelot/kanagawa.nvim",
	name = "kanagawa",
	priority = 1001,
	config = function()
		vim.cmd.colorscheme("kanagawa-wave")
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "grey" })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "orange" })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "grey" })
	end,
}
