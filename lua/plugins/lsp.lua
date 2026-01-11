return {
    "mason-org/mason.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    keys = {
        {
            "<leader>M",
            "<CMD>Mason<CR>",
            desc = "Mason",
        },
    },

    -- LSP setups
    vim.lsp.enable({
        "lua_ls",
        "html", "cssls", "ts_ls", "tailwindcss",
        "laravel_ls", "intelephense",
    }),

    vim.lsp.config("lua_ls", {
        settings = {
            Lua = {
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true), },
            },
        },
    }),
}
