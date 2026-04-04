return {
    { -- Collection of various small independent plugins/modules
        'echasnovski/mini.nvim',
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
            --  - ci'  - [C]hange [I]nside [']quote
            require('mini.ai').setup({ n_lines = 500 })

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require('mini.surround').setup()

            local wk = require('which-key')

            wk.add({
                { 's', group = 'surround' },

                { 'sa', desc = 'Add surrounding' },

                { 'sd', desc = 'Delete surrounding' },
                { 'sdn', desc = 'Delete next surrounding' },
                { 'sdl', desc = 'Delete previous surrounding' },

                { 'sr', desc = 'Replace surrounding' },
                { 'srn', desc = 'Replace next surrounding' },
                { 'srl', desc = 'Replace previous surrounding' },

                { 'sf', desc = 'Find right surrounding' },
                { 'sfn', desc = 'Find next right surrounding' },
                { 'sfl', desc = 'Find previous right surrounding' },

                { 'sF', desc = 'Find left surrounding' },
                { 'sFn', desc = 'Find next left surrounding' },
                { 'sFl', desc = 'Find previous left surrounding' },

                { 'sh', desc = 'Highlight surrounding' },
                { 'shn', desc = 'Highlight next surrounding' },
                { 'shl', desc = 'Highlight previous surrounding' },
            })

            -- Simple and easy statusline.
            --  You could remove this setup call if you don't like it,
            --  and try some other statusline plugin
            -- local statusline = require('mini.statusline')
            -- set use_icons to true if you have a Nerd Font
            -- statusline.setup({ use_icons = vim.g.have_nerd_font })

            -- You can configure sections in the statusline by overriding their
            -- default behavior. For example, here we set the section for
            -- cursor location to LINE:COLUMN
            ---@diagnostic disable-next-line: duplicate-set-field
            -- statusline.section_location = function()
            -- return '%l/%L'
            -- end

            -- statusline.section_filename = function()
            --     local filename = vim.fn.expand('%:t')
            --     if filename == '' then
            --         filename = '[No Name]'
            --     end
            --     vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', { fg = '#ffffff', bg = '#282c34', bold = false })
            --
            --     local modified = vim.bo.modified and ' ●' or ''
            --     local readonly = vim.bo.readonly and ' 🔒' or ''
            --     return filename .. modified .. readonly
            -- end

            -- ... and there is more!
            --  Check out: https://github.com/echasnovski/mini.nvim
        end,
    },
}
