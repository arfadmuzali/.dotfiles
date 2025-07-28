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
            -- { icon = ' ', key = 'op', desc = 'Open Project', action = ':OpenDir' },
            -- { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
            -- { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            -- { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            -- { icon = ' ', key = 'd', desc = 'Find Folder', action = ':lua Snacks.dashboard.find_folders()' },
            -- { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            -- { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
            { icon = ' ', key = 'g', desc = 'Games', action = ':VimBeGood' },
            { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },

            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
          },
        },
        sections = {
          { section = 'header' },
          { icon = ' ', title = 'Keys', section = 'keys', indent = 1, padding = 1 },
          { icon = ' ', title = 'Projects', section = 'projects', indent = 1, padding = 1 },
          -- { section = 'startup' },
        },
      },
    },
  },
}
