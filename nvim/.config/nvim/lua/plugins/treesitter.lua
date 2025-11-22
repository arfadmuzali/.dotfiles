return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        branch = 'master',
        main = 'nvim-treesitter.configs', -- Sets main module to use for opts
        opts = {
            ensure_installed = {
                'bash',
                'c',
                'diff',
                'html',
                'lua',
                'go',
                'luadoc',
                'markdown',
                'markdown_inline',
                'query',
                'vim',
                'vimdoc',
            },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {
            max_lines = 2,
        },
    },
}
