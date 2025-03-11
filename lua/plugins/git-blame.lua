return {
	"f-person/git-blame.nvim",
	event = "VeryLazy",
	opts = {
		enabled = true,
		message_template = " <summary> • <date> • <author> • <<sha>>",
		date_format = "%m-%d-%Y %H:%M:%S",
		virtual_text = false,
    display_virtual_text = false,
    message_when_non_committed = "",
	},
	keys = {
		{ "<leader>gb", "<cmd>GitBlameShowFull<CR>", desc = "Show Git Blame Full" },
	},
}
