return {
    -- BLINK
    -- https://github.com/Saghen/blink.cmp
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            ---@module 'blink.cmp'
            ---@type blink.cmp.Config
            keymap = { preset = 'super-tab' },
            appearance = { nerd_font_variant = 'mono' },
            completion = { 
                documentation = { 
                    auto_show = false,
                    window = { 
                        scrollbar = false,
                        max_width = 60,
                        max_height = 30,
                    }
                },
                menu = {
                    scrollbar = false,
                    draw = {
                        columns = {
                            { "label", "kind", gap = 4 },
                            -- { "label", "label_description", gap = 1 },
                            -- { "kind" },
                        }
                    }
                }
            },
            -- signature = { enabled = true },
            cmdline = { enabled = false },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },

}
