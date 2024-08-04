local on_attach = function(client, bufnr)
  local opts = { remap = false, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Describe symbol', unpack(opts) })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration', unpack(opts) })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition', unpack(opts) })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation', unpack(opts) })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'View references', unpack(opts) })
  vim.keymap.set('n', '<Leader>lh', vim.lsp.buf.signature_help, { desc = 'Display signature help', unpack(opts) })
  vim.keymap.set('n', '<Leader>lt', vim.lsp.buf.type_definition, { desc = 'Display type definition', unpack(opts) })
  vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, { desc = 'Rename', unpack(opts) })
  vim.keymap.set('n', '<Leader>la', vim.lsp.buf.code_action, { desc = 'Code actions', unpack(opts) })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local opts = { silent = true }
      vim.keymap.set('n', '<Leader>ld', vim.diagnostic.open_float, { desc = 'Display diagnostic info', unpack(opts) })
      vim.keymap.set(
        'n',
        '<Leader>lD',
        '<cmd>Telescope diagnostics bufnr=0<cr>',
        { desc = 'View all diagnostics', unpack(opts) }
      )
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic', unpack(opts) })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic', unpack(opts) })

      local lspconfig = require('lspconfig')
      lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          ['rust-analyzer'] = {
            imports = {
              granularity = {
                group = 'module',
              },
              prefix = 'self',
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
          },
        },
      })

      lspconfig.volar.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = os.getenv('VUE_TS_PLUGIN_PATH'),
              languages = { 'javascript', 'typescript', 'vue' },
            },
          },
        },
        filetypes = { 'javascript', 'typescript', 'vue' },
      })
      lspconfig.graphql.setup({
        on_attach = on_attach,
        filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'vue' },
        capabilities = capabilities,
        root_dir = function(fname)
          return lspconfig.util.find_git_ancestor(fname)
        end,
      })
      lspconfig.clangd.setup({ {
        on_attach = on_attach,
        capabilities = capabilities,
      } })
      lspconfig.glsl_analyzer.setup({ {
        on_attach = on_attach,
        capabilities = capabilities,
      } })
      lspconfig.intelephense.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      local conform = require('conform')
      local js_formatter = { 'prettierd', 'prettier', lsp_format = 'fallback', stop_after_first = true }
      conform.setup({
        formatters_by_ft = {
          lua = { 'stylua' },
          rust = { 'rustfmt', lsp_format = 'fallback' },
          javascript = js_formatter,
          typescript = js_formatter,
          vue = js_formatter,
        },
      })

      vim.keymap.set('n', '<Leader>lf', function()
        conform.format({ bufnr = bufnr })
      end, { desc = 'Format document' })
    end,
  },
  {
    'mfussenegger/nvim-lint',
    config = function()
      require('lint').linters_by_ft = {
        markdown = { 'vale' },
        typescript = { 'eslint_d' },
        javascript = { 'eslint_d' },
        vue = { 'eslint_d' },
      }
    end,
  },
}
