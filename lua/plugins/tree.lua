return {
  'kyazdani42/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup({
      filters = { custom = { '^.git$' } },
      hijack_cursor = true,
      view = {
        adaptive_size = true,
        side = 'left',
        width = 25,
        hide_root_folder = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
      },
    })

    vim.api.nvim_create_autocmd({ 'VimEnter' }, {
      callback = function()
        require('nvim-tree.api').tree.open()
      end,
    })
  end,
}
