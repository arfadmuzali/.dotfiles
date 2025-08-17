return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      dashboard = {
        enable = true,
        preset = {
          keys = {
            -- { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
            -- { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            -- { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            -- { icon = ' ', key = 'd', desc = 'Find Folder', action = ':lua Snacks.dashboard.find_folders()' },
            -- { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
            -- { icon = ' ', key = 'p', desc = 'Open Project', action = ":lua Snacks.dashboard.pick('directory', {cwd = '/home/arfad/projects'})" },
            { icon = ' ', key = 'g', desc = 'Games', action = ':VimBeGood' },
            { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          },
        },
        sections = {
          { section = 'header' },
          { section = 'keys', gap = '1' },
          -- { section = 'startup' },
        },
      },
    },
  },
}
