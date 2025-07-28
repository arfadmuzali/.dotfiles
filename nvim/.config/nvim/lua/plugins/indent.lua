return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    -- Auto enable/disable visual mode
    local indent_blankline_augroup = vim.api.nvim_create_augroup('indent_blankline_augroup', { clear = true })

    vim.api.nvim_create_autocmd('ModeChanged', {
      group = indent_blankline_augroup,
      pattern = '[vV\x16]*:*',
      command = 'IBLEnable',
      desc = 'Enable indent-blankline when exiting visual mode',
    })

    vim.api.nvim_create_autocmd('ModeChanged', {
      group = indent_blankline_augroup,
      pattern = '*:[vV\x16]*',
      command = 'IBLDisable',
      desc = 'Disable indent-blankline when entering visual mode',
    })

    -- Register highlight groups
    local hooks = require 'ibl.hooks'

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      -- Default indent = abu-abu
      vim.api.nvim_set_hl(0, 'IblIndent', { fg = '#3B3B3B' })

      -- Scope warna pelangi
      vim.api.nvim_set_hl(0, 'IblScopeRed', { fg = '#E06C75' })
      vim.api.nvim_set_hl(0, 'IblScopeYellow', { fg = '#E5C07B' })
      vim.api.nvim_set_hl(0, 'IblScopeBlue', { fg = '#61AFEF' })
      vim.api.nvim_set_hl(0, 'IblScopeOrange', { fg = '#D19A66' })
      vim.api.nvim_set_hl(0, 'IblScopeGreen', { fg = '#98C379' })
      vim.api.nvim_set_hl(0, 'IblScopeViolet', { fg = '#C678DD' })
      vim.api.nvim_set_hl(0, 'IblScopeCyan', { fg = '#56B6C2' })
    end)

    require('ibl').setup {
      indent = {
        char = '│',
        tab_char = '│',

        highlight = 'IblIndent',
      },
      scope = {
        enabled = true,
        highlight = {
          'IblScopeBlue',
          'IblScopeRed',
          'IblScopeYellow',
          'IblScopeOrange',
          'IblScopeGreen',
          'IblScopeViolet',
          'IblScopeCyan',
        },
        show_start = false,
        show_end = false,
      },
    }

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
