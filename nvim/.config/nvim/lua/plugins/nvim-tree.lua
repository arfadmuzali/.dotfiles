return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        disable_netrw = true,
        hijack_netrw = true,
        view = {
          relativenumber = true,
          float = {
            enable = true,
            quit_on_focus_loss = true,
            open_win_config = function()
              local screen_w = vim.opt.columns:get()
              local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
              local window_w = screen_w * 0.8 -- Adjust width ratio as desired
              local window_h = screen_h * 0.8 -- Adjust height ratio as desired
              local window_w_int = math.floor(window_w)
              local window_h_int = math.floor(window_h)
              local center_x = (screen_w - window_w) / 2
              local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

              return {
                border = 'rounded', -- or "single", "double", "none"
                relative = 'editor',
                row = center_y,
                col = center_x,
                width = window_w_int,
                height = window_h_int,
              }
            end,
          },
        },

        renderer = {
          highlight_git = true,
          highlight_opened_files = 'icon',
          indent_markers = {
            enable = true,
          },
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false,
        },
        git = {
          enable = true,
          ignore = false,
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      }

      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

      local colors = require 'onedark.colors'
      vim.cmd(
        string.format(
          [[
	highlight FloatBorder  guibg=%s guifg=%s
	highlight NvimTreeNormalFloat  guibg=%s
        highlight NvimTreeNormal       guibg=%s
        highlight NvimTreeVertSplit    guibg=%s guifg=%s
        highlight NvimTreeEndOfBuffer  guibg=%s
        highlight NvimTreeRootFolder   guifg=%s gui=bold
        highlight NvimTreeFolderName   guifg=%s
        highlight NvimTreeOpenedFolderName guifg=%s gui=italic
        highlight NvimTreeGitDirty     guifg=%s
        highlight NvimTreeGitNew       guifg=%s
        highlight NvimTreeGitDeleted   guifg=%s
      ]],
          colors.bg0,
          colors.grey,
          colors.bg0,
          colors.bg0,
          colors.bg0,
          colors.grey,
          colors.bg0,
          colors.blue,
          colors.fg,
          colors.blue,
          colors.yellow,
          colors.green,
          colors.red
        )
      )
    end,
  },
}
