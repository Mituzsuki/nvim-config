return {
  "m4xshen/autoclose.nvim",
  config = function()
    require("autoclose").setup({
      autotag = {
        enable = true,
      },
    })
  end,
}
