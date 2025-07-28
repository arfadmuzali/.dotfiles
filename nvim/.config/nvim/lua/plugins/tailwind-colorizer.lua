return {
  {
    'roobert/tailwindcss-colorizer-cmp.nvim',
    opts = {},
    config = function()
      require('tailwindcss-colorizer-cmp').setup {
        color_square_width = 2,
      }
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    optional = true,
    dependencies = {
      { 'roobert/tailwindcss-colorizer-cmp.nvim', opts = {} },
    },
  },
}
