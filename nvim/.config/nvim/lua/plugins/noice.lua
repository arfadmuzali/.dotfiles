return {
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        opts = {
            presets = {
                bottom_search = true,
            },
            views = {
                cmdline_popup = {
                    position = {
                        row = 0,
                    },
                },
            },
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            'MunifTanjim/nui.nvim',
        },
    },
}
