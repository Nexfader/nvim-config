return {
  {
    'sainnhe/gruvbox-material',
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_ui_contrast = 'high'
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  'lukas-reineke/indent-blankline.nvim',
  'kyazdani42/nvim-web-devicons',
}
