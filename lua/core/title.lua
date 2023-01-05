vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    local dirname = vim.fn.expand('%:p:h:t')
    local filename = vim.fn.expand('%:p:t')

    local titlestring = dirname
    if filename ~= '' and filename ~= 'NvimTree_1' then
      titlestring = filename .. ' - ' .. titlestring
    end

    vim.opt.titlestring = titlestring
  end
})
