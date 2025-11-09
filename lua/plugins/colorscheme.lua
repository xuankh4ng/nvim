return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "hard"
      vim.g.disable_italic_comment = 1
      vim.g.everforest_transparent_background = 0
      vim.g.everforest_ui_contrast = "high"
      vim.g.everforest_float_style = "bright"
      vim.cmd.colorscheme("everforest")
    end
  },
}
