return {
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

            ["<A-n>"] = { "select_next", "fallback_to_mappings" },
            ["<A-p>"] = { "select_prev", "fallback_to_mappings" },

            ["<A-N>"] = { "scroll_documentation_down", "fallback" },
            ["<A-P>"] = { "scroll_documentation_up", "fallback" },

            ["<A-s>"] = { "show_signature", "hide_signature", "fallback" },
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            list = {
                selection = { preselect = true, auto_insert = false },
            },
            documentation = {
                auto_show = false,
            },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
