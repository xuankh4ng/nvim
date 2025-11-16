return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>fm",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      python = { "black" },
      html = { "prettier", stop_after_first = true },
      css = { "prettier", stop_after_first = true },
      javascript = { "prettier", stop_after_first = true },
      typescript = { "prettier", stop_after_first = true },
      javascriptreact = { "prettier", stop_after_first = true },
      typescriptreact = { "prettier", stop_after_first = true },
      php = { "php_cs_fixer" },
      blade = { "blade-formatter" },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
}
