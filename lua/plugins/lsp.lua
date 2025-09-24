return {
  {
    "mason-org/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {},

    -- LSP setups
    vim.lsp.enable({
      "lua_ls",
      "pyright",
      "html", "cssls", "ts_ls",
      "marksman",
      "intelephense",
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
