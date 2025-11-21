---@diagnostic disable: undefined-global
return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    bigfile = { enabled = true },
    explorer = { enabled = true },
    picker = {
      layout = {
        cycle = false,
      },
      enabled = true,
      win = {
        input = {
          keys = {
            ["<C-[>"] = { "close", mode = { "n", "i" } },
            ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["H"] = { "preview_scroll_left", mode = { "i", "n" } },
            ["L"] = { "preview_scroll_right", mode = { "i", "n" } },
            ["<A-n>"] = { "list_down", mode = { "i", "n" } },
            ["<A-p>"] = { "list_up", mode = { "i", "n" } },
          },
        },
      },
    },
  },
  keys = {
    -- Find
    { "<leader><space>", function() Snacks.picker.files() end, desc = "Find files", },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Find projects", },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find buffers", },
    { "<leader>bd", function() Snacks.picker.bufdelete() end, desc = "Delete buffer", },
    { "<leader>e", function() Snacks.picker.explorer() end, desc = "Explorer", },

    -- Search
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Search help", },
    { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Search Highlight", },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Search keymaps", },
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Search Diagnostics", },
    { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },

    -- Git
    { "<leader>lg", function() Snacks.lazygit() end, desc = "Open Lazygit", },
    { "<leader>gb", function() Snacks.gitbrowse() end, desc = "Open Github browser", },

    -- LSP
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto definitions", },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto type definitions", },
    { "gr", function() Snacks.picker.lsp_references() end, desc = "Goto references", },
    { "gi", function() Snacks.picker.lsp_implementations() end, desc = "Goto implementations", },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols", },
  },
}
