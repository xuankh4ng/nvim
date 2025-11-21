return {
  {
    "mason-org/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {},
    keys = {
      {
        "<leader>M",
        ":Mason<CR>",
        desc = "Mason",
      },
    },

    -- LSP setups
    vim.lsp.enable({
      -- Lua
      "lua_ls",

      -- Python
      "basedpyright", "djlsp",

      -- Web
      "html", "cssls", "ts_ls", "tailwindcss",
      "laravel_ls", "phpactor",
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
}
