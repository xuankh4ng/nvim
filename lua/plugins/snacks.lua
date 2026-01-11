---@diagnostic disable: undefined-global
return {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        bigfile = { enabled = true },
        explorer = { enabled = true },
        picker = {
            layout = "ivy",
            enabled = true,
            win = {
                input = {
                    keys = {
                        ["<C-[>"] = { "close", mode = { "n", "i" } },
                        ["<A-n>"] = { "list_down", mode = { "i", "n" } },
                        ["<A-p>"] = { "list_up", mode = { "i", "n" } },
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
                Snacks.picker.projects({
                    dev = { "~/dev" },
                    recent = false,
                })
            end,
            desc = "Find projects",
        },
        { "<leader><space>", function() Snacks.picker.files() end,                                   desc = "Find files", },
        { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },

        -- Search
        { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Search help", },
        { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Search keymaps", },
        { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Search Diagnostics", },

        -- Git
        { "<leader>lg",      function() Snacks.lazygit() end,                                        desc = "Open Lazygit", },
        { "<leader>gb",      function() Snacks.gitbrowse() end,                                      desc = "Open Github browser", },

        -- LSP
        { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto definitions", },
        { "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto type definitions", },
        { "gr",              function() Snacks.picker.lsp_references() end,                          desc = "Goto references", },
        { "gi",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto implementations", },
        { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols", },
    },
}
