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
      },
      renderer = {
        root_folder_label = false,
        indent_markers = {
          enable = true,
        },
      },
      update_focused_file = {
        enable = true,
        update_root = {
          enable = false,
          ignore_list = {},
        },
        exclude = false,
      },
    })

    vim.api.nvim_create_autocmd({ 'VimEnter' }, {
      callback = function()
        require('nvim-tree.api').tree.open()
      end,
    })
  end,
}
