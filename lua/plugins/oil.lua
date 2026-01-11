return {
    "stevearc/oil.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    priority = 1000,
    opts = {
        columns = {
            { "permissions", highlight = "Function" },
            { "mtime",       highlight = "Comment", format = "%b %d %H:%M" },
            { "size",        highlight = "Special" },
            "icon",
        },
        buf_options = {
            buflisted = true,
            bufhidden = "hide",
        },
        delete_to_trash = true,
        view_options = { show_hidden = true, },
    },
    keys = {
        {
            "<leader>o",
            "<CMD>Oil<CR>",
            desc = "Oil",
        },
    }
}
