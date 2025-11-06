return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    bigfile = { enabled = true },
    lazygit = { enabled = true },
    gitbrowse = { enabled = true },
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
    -- Find
    {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
      desc = "Find projects",
    },
    {
      "<leader><space>",
      function()
        Snacks.picker.files()
      end,
      desc = "Find files",
    },

    -- Searching
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Search help",
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps({ layout = "select" })
      end,
      desc = "Search keymaps",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics({ layout = "vertical" })
      end,
      desc = "Search Diagnostics",
    },

    -- Git
    {
      "<leader>lg",
      function()
        Snacks.lazygit()
      end,
      desc = "Open Lazygit",
    },
    {
      "<leader>gb",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Open Github browser",
    },

    -- LSP
    {
      "gy",
      function()
        Snacks.picker.lsp_type_definitions({ layout = "ivy" })
      end,
      desc = "Goto type definitions",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references({ layout = "ivy" })
      end,
      desc = "Goto references",
    },
    {
      "gi",
      function()
        Snacks.picker.lsp_implementations({ layout = "ivy" })
      end,
      desc = "Goto implementations",
    },
  },
}
