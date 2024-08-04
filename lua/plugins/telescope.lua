return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      file_ignore_patterns = { 'node_modules' },
    },
  },
}
