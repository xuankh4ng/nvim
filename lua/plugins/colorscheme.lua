return {
  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "hard",
        disable_italic_comment = true,
        ui_contrast = "high",
        transparent_background_level = 0,
        float_style = "bright",
      })
      vim.cmd("colorscheme everforest")
    end,
  },
}
