return {
  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
      require("everforest").setup({
        background = "hard",
        transparent_background_level = 1,
        ui_contrast = "high",
      })
      vim.cmd("colorscheme everforest")
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      require("nordic").load()
      vim.cmd("colorscheme nordic")
    end,
  },
}
