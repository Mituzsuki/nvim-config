return {
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      attach_to_untracked = false,
    },
    config = function(_, opts)
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        local ok, gitsigns = pcall(require, "gitsigns")
        if ok then gitsigns.setup(opts) end
      end,
    })
  end,
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      animation = true,
      auto_hide = false,
      tabpages = true,
      clickable = true,
      insert_at_end = true,
      icons = { buffer_index = true },
    },
    version = '^1.0.0',
    keys = {
      { '<A-,>', '<Cmd>BufferPrevious<CR>', desc = 'Previous buffer' },
      { '<A-.>', '<Cmd>BufferNext<CR>',     desc = 'Next buffer' },
      { '<A-1>', '<Cmd>BufferGoto 1<CR>',   desc = 'Go to buffer 1' },
      { '<A-2>', '<Cmd>BufferGoto 2<CR>',   desc = 'Go to buffer 2' },
      { '<A-p>', '<Cmd>BufferPin<CR>',      desc = 'Pin buffer' },
      { '<A-c>', '<Cmd>BufferClose<CR>',    desc = 'Close buffer' },
    }
  }
}
