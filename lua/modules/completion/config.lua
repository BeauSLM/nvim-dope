-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local config = {}

function config.navigator()
  -- nvim-autopairs
  require('nvim-autopairs').setup { disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" }, }

  -- cmp
  if vim.o.ft == 'clap_input' and vim.o.ft == 'guihua' and vim.o.ft == 'guihua_rust' then
    require('cmp').setup.buffer { completion = { enable = false } }
  end

  require('navigator').setup {
    lsp = {
      code_lens_action = { enable = false },
      servers = {
        'cssmodules_ls',
        'eslint',
        'tailwindcss',
      },
      disable_lsp = { "rust_analyzer", "clangd" },
      format_on_save = false,
    },
    lsp_signature_help = true,
    signature_help_cfg = require('lsp_signature').setup {
      always_trigger = true,
    }
  }
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

  cmp.event:on(
    'confirm_done',
    require('nvim-autopairs.completion.cmp').on_confirm_done()
  )
  cmp.setup({
    preselect = cmp.PreselectMode.Item,
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
    },
    sources = {
      { name = 'crates' },
      { name = 'npm' },
      { name = 'conventionalcommits' },
      { name = 'latex_symbols' },
      { name = 'fish' },
      { name = 'nvim_lua' },
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
