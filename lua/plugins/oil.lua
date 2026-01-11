return {
    "stevearc/oil.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        columns = {
            { "permissions", highlight = "Function" },
            { "mtime", highlight = "Comment", format = "%b %d %H:%M" },
            { "size", highlight = "Special" },
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
