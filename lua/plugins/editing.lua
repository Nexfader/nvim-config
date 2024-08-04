return {
  {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end,
  },
  {
    'folke/ts-comments.nvim',
    event = 'VeryLazy',
  },
  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    config = function(_, opts)
      require('mini.pairs').setup({
        modes = { insert = true, command = true, terminal = false },
      })
    end,
  },
}
