return {
  'jose-elias-alvarez/null-ls.nvim',
  {
    'neovim/nvim-lspconfig',
    config = function()
      local opts = { silent = true }
      vim.keymap.set('n', '<Leader>ld', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '<Leader>lD', '<cmd>Telescope diagnostics bufnr=0<cr>', opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

      -- vim.api.nvim_create_autocmd('BufWritePost', {
      --   callback = function()
      --     vim.lsp.buf.format()
      --   end
      -- })

      local on_attach = function(client, bufnr)
        local bufopts = { remap = false, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<Leader>lh', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<Leader>la', vim.lsp.buf.code_action, bufopts)

        if client.supports_method('textDocument/formatting') then
          vim.keymap.set('n', '<Leader>lf', function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end, bufopts)
        end
      end

      local lspconfig = require('lspconfig')
      -- lspconfig['tsserver'].setup{
      --   on_attach = on_attach,
      -- }
      lspconfig['volar'].setup {
        on_attach = on_attach,
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
      }
      lspconfig['intelephense'].setup {
        on_attach = on_attach,
      }
      lspconfig['clangd'].setup {
        on_attach = on_attach,
      }
      lspconfig['pyright'].setup {
        on_attach = on_attach,
      }
      lspconfig['sumneko_lua'].setup {
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }

      local null_ls = require('null-ls')
      null_ls.setup({
        on_attach = on_attach,
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.diagnostics.eslint_d,
        },
      })
    end,
  }
}
