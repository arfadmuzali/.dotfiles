return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {
        enable_check_bracket_line = true, --- check bracket in same line
        enable_moveright = false,
        check_ts = false,
        map_cr = false,
      }
    end,
  },
}
