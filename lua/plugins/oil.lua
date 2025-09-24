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
      "<leader>e",
      ":Oil<CR>",
      silent = true,
      noremap = true,
      desc = "Oil File Explore",
    },
  }
}
