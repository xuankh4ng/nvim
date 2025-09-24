return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    bigfile = { enabled = true },
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
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>r",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent Files",
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log({
          layout = "vertical",
        })
      end,
      desc = "Git Log",
    },
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches({
          layout = "select",
        })
      end,
      desc = "Git Branches",
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps({
          layout = "select",
        })
      end,
      desc = "Search Keymaps",
    },
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definitions",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references({
          layout = "ivy",
        })
      end,
      desc = "Goto References",
    },
    {
      "gi",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementations",
    },
  },
}
