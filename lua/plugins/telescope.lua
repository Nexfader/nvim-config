return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.0',
  cmd = 'Telescope',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = { 'node_modules' },
      },
    })
  end,
}
