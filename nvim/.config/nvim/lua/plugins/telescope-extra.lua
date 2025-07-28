return {
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-telescope/telescope-project.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      local home = vim.fn.expand '~'

      require('telescope').setup {
        extensions = {
          project = {
            base_dirs = {
              { path = home .. '/projects', max_depth = 3 },
              { path = home .. '/learn', max_depth = 3 },
              { path = home .. '/.config', max_depth = 5 },
            },
            hidden_files = true,
            theme = 'dropdown',
            order_by = 'recent',
            search_by = 'title',
            sync_with_nvim_tree = true,
            respect_buf_cwd = true,
          },
        },
      }

      require('telescope').load_extension 'project'
    end,
  },
}
