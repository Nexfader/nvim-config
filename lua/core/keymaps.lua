local keymap = vim.keymap

keymap.set('n', '<Space>', '<Nop>')

-- Split navigation
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')

keymap.set('n', '<Esc>', '<cmd>noh<cr>')

-- Telescope
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>')

-- Nvim-Tree
keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')

keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>')
keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>')
keymap.set('n', '<leader>bd', '<cmd>Bdelete<cr>')
