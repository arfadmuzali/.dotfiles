return {
    {
        'nvimdev/lspsaga.nvim',
        event = 'LspAttach',
        config = function()
            require('lspsaga').setup({
                symbol_in_winbar = {
                    enable = false,
                },
                lightbulb = {
                    enable = false,
                    sign = false,
                    virtual_text = false,
                },
            })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        },
    },
    vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', { silent = true }),
    vim.keymap.set('n', 'gk', '<cmd>Lspsaga hover_doc<CR>', { silent = true }),
    vim.keymap.set('n', 'gD', '<cmd>Lspsaga goto_definition<CR>', { silent = true }),
}
