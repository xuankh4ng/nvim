return {
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = { "InsertEnter" },
    version = "v1.*",
    opts = {
      keymap = {
        preset = "none",
        ["<A-m>"] = { "show", "show_documentation", "hide_documentation" },
        ["<A-y>"] = { "accept" },

        ["<Tab>"] = { "snippet_forward", "fallback", },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<A-n>"] = { "select_next", "fallback" },
        ["<A-p>"] = { "select_prev", "fallback" },

        ["<A-N>"] = { "scroll_documentation_down", "fallback" },
        ["<A-P>"] = { "scroll_documentation_up", "fallback" },

        ["<A-s>"] = { "show_signature", "hide_signature", "fallback" },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = {
          auto_show = true,
        },
        menu = {
          draw = {
            components = {
              -- customize the drawing of kind icons
              kind_icon = {
                text = function(ctx)
                  -- default kind icon
                  local icon = ctx.kind_icon
                  -- if LSP source, check for color derived from documentation
                  if ctx.item.source_name == "LSP" then
                    local color_item = require("nvim-highlight-colors").format(ctx.item.documentation,
                      { kind = ctx.kind })
                    if color_item and color_item.abbr ~= "" then
                      icon = color_item.abbr
                    end
                  end
                  return icon .. ctx.icon_gap
                end,
                highlight = function(ctx)
                  -- default highlight group
                  local highlight = "BlinkCmpKind" .. ctx.kind
                  -- if LSP source, check for color derived from documentation
                  if ctx.item.source_name == "LSP" then
                    local color_item = require("nvim-highlight-colors").format(ctx.item.documentation,
                      { kind = ctx.kind })
                    if color_item and color_item.abbr_hl_group then
                      highlight = color_item.abbr_hl_group
                    end
                  end
                  return highlight
                end,
              },
            },
          },
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
