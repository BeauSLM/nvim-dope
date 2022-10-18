-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local config = {}

function config.nvim_lsp()
  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap = true, silent = true }
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local lsp = require('modules.completion.lsp')
  local capabilities = vim.lsp.protocol.make_client_capabilities()
	-- nvim-cmp-lsp
  if not packer_plugins['cmp-nvim-lsp'].loaded then vim.cmd([[packadd cmp-nvim-lsp]]) end
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities) -- cmp-nvim-lsp

  for _, server in pairs(lsp.servers) do
    require('lspconfig')[server].setup {
      -- configure flags (debounce, etc)?
      on_attach = lsp.on_attach,
      capabilities = capabilities,
    }
  end
end

function config.null_ls()
  local nls = require('null-ls')
  nls.setup {
    sources = {
      -- nls.builtins.code_actions.gitsigns,
      nls.builtins.code_actions.shellcheck,
      nls.builtins.diagnostics.eslint,
      nls.builtins.diagnostics.fish,
      nls.builtins.formatting.rustfmt,
    }
  }
end

function config.nvim_cmp()
  local cmp = require('cmp')

  cmp.setup({
    completion = { autocomplete = false, },
    preselect = cmp.PreselectMode.Item,
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
      ['<C-y>'] = cmp.mapping.complete(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
    },
    sources = {
      -- { name = 'crates' },
      -- { name = 'npm' },
      { name = 'fish' },
      { name = 'nvim_lua' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'buffer' }
    }
  })
end

function config.lua_snip()
  local ls = require('luasnip')
  local types = require('luasnip.util.types')
  ls.config.set_config({
    history = true,
    enable_autosnippets = true,
    updateevents = 'TextChanged,TextChangedI',
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { '<- choiceNode', 'Comment' } },
        },
      },
    },
  })
  require('luasnip.loaders.from_lua').lazy_load({ paths = vim.fn.stdpath('config') .. '/snippets' })
  require('luasnip.loaders.from_vscode').lazy_load()
  require('luasnip.loaders.from_vscode').lazy_load({
    paths = { './snippets/' },
  })
  -- snippet navigation
  vim.cmd([[
    imap <silent><expr> <C-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-k>'
    inoremap <silent> <C-j> <cmd>lua require('luasnip').jump(-1)<Cr>
    snoremap <silent> <C-k> <cmd>lua require('luasnip').jump(1)<Cr>
    snoremap <silent> <C-j> <cmd>lua require('luasnip').jump(-1)<Cr>
  ]])
end

return config
