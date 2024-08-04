local keymap = vim.keymap

keymap.set('n', '<Space>', '<Nop>')

keymap.set('i', '<C-Backspace>', '<C-W>')

-- Split navigation
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')

keymap.set('n', '<Esc>', '<cmd>noh<cr>')

-- Telescope
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find file' })
keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Search project'})
keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Recent files' })
keymap.set('n', '<leader>,', '<cmd>Telescope buffers<cr>', { desc = 'Switch to buffer'})

-- Nvim-Tree
keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle file tree' })

-- Buffers
keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer' })
keymap.set('n', '<leader>bd', '<cmd>Bdelete<cr>', { desc = 'Kill buffer' })
