return {
  'tpope/vim-fugitive',
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
    config = function()
      require('gitsigns').setup()
    end,
  },
}
