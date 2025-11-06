return {
  "stevearc/oil.nvim",
  lazy = false,
  priority = 1000,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    delete_to_trash = true,
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    {
      "<leader>o",
      ":Oil<CR>",
      silent = true,
      noremap = true,
      desc = "[O]il",
    },
  }
}
