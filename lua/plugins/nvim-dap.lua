return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
		},
	},
	{
		"rcarriga/nvim-dap-ui", -- Optional, for a nice UI for debugging
		dependencies = { "mfussenegger/nvim-dap" },
	},
}
