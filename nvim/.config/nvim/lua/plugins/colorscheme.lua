return {
    {
        'rebelot/kanagawa.nvim',
        priority = 1000, -- Ensure it loads first
        config = function()
            require('kanagawa').setup({
                transparent = false,
                keywordStyle = { italic = false },
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = 'none',
                            },
                        },
                    },
                },
            })
            vim.cmd.colorscheme('kanagawa')
        end,
    },
}
