return {
  'kyazdani42/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup {
      open_on_setup = true,
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
    }
  end,
}
