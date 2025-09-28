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
    -- Finding
    {
      "<leader>fp",
      function()
        Snacks.picker.projects({
        })
      end,
      desc = "Find Projects",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.files({
          cwd = vim.fn.stdpath("config")
        })
      end,
      desc = "Find Config File",
    },
    {
      "<leader>b",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Find Buffers",
    },
    {
      "<leader><space>",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>r",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent Files",
    },

    -- Searching
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
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
      "<leader>sj",
      function()
        Snacks.picker.jumps({
          layout = "vertical",
        })
      end,
      desc = "Search Jumps",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics({
          layout = "vertical",
        })
      end,
      desc = "Search Diagnostics",
    },

    -- Git
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
      "<leader>gs",
      function()
        Snacks.picker.git_status({
          layout = "select",
        })
      end,
      desc = "Git Status",
    },

    -- LSP
    {
      "ld",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definitions",
    },
    {
      "lr",
      function()
        Snacks.picker.lsp_references({
          layout = "ivy",
        })
      end,
      desc = "Goto References",
    },
    {
      "li",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementations",
    },
  },
}
