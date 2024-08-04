vim.g.neovide_cursor_animation_length = 0.0
vim.g.neovide_cursor_trail_size = 0.0
vim.g.neovide_scale_factor = 0.75
vim.opt.guifont = { 'Hack Nerd Font', ':h16' }

local function neovideScale(delta)
  local scale = vim.g.neovide_scale_factor + delta
  if scale < 0.5 then
    return
  end

  vim.g.neovide_scale_factor = scale
end

vim.keymap.set('n', '<C-=>', function()
  neovideScale(0.1)
end)

vim.keymap.set('n', '<C-->', function()
  neovideScale(-0.1)
end)
