return {
  {
    'sainnhe/gruvbox-material',
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_ui_contrast = 'high'
      vim.cmd.colorscheme('gruvbox-material')
    end,
  },
  'kyazdani42/nvim-web-devicons',
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({
        options = {
          globalstatus = true,
          component_separators = '',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = { 'diagnostics', 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      })
    end,
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('bufferline').setup({
        options = {
          right_mouse_command = '',
          middle_mouse_command = 'Bdelete! %d',
          close_command = 'Bdelete! %d',
          custom_filter = function(buf)
            local ignore_filetypes = { 'fugitive', 'qf', 'help' }
            for _, value in ipairs(ignore_filetypes) do
              if vim.bo[buf].filetype == value then
                return false
              end
            end
            return true
          end,
        },
      })
    end,
  },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
}
