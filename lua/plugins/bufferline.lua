return {
  'akinsho/bufferline.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  config = function()
    require('bufferline').setup({
      options = {
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
          },
        },
        right_mouse_command = '',
        middle_mouse_command = 'Bdelete! %d',
        close_command = 'Bdelete! %d',
      },
    })
  end,
}
