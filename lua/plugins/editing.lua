return {
  {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end,
  },
  {
    'numToStr/Comment.nvim',
    keys = { 'gc', 'gb' },
    config = function()
      require('Comment').setup()
    end,
  },
  'editorconfig/editorconfig-vim',
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  },
}
