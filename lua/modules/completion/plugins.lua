-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.completion.config')
local filetypes = {
  'html',
  'css',
  'javascript',
  'java',
  'javascriptreact',
  'vue',
  'typescript',
  'typescriptreact',
  'go',
  'lua',
  'cpp',
  'c',
  'markdown',
  'makefile',
  'python',
  'bash',
  'sh',
  'php',
  'yaml',
  'json',
  'sql',
  'vim',
  'sh',
  'tex',
  'svelte',
  'nim'
}

plugin({
  'neovim/nvim-lspconfig',
  -- used filetype to lazyload lsp
  -- config your language filetype in here
  ft = filetypes,
})

plugin({ 'windwp/nvim-autopairs' })

plugin {
  'ray-x/navigator.lua',
  requires = {
    { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
    'neovim/nvim-lspconfig',
    'ray-x/lsp_signature.nvim',
    'gigablaster/rust-tools.nvim', -- TODO: go back to original when https://github.com/simrat39/rust-tools.nvim/issues/157 is fixed
    'p00f/clangd_extensions.nvim',
  },
  -- TODO: set filetypes 
  -- texlab, rust_analyzer, clangd, pyright, tailwindcss, eslint, cssmodules_ls, html, tsserver, jdtls, svelte, sqls, gopls, sumneko_lua, bashls, vimls, jsonls, cssls, yamlls, nimls, vuels, phpactor
  -- ^^ configured lsp's for reference
  ft = filetypes,
  config = conf.navigator,
  commit = '05753da8db0e7fdb979cc5fc396965b150e09d79',
}

plugin ({
  'jose-elias-alvarez/null-ls.nvim',
  config = conf.null_ls,
})

plugin({
  'hrsh7th/nvim-cmp',
  event = 'BufReadPre',
  config = conf.nvim_cmp,
  requires = {
    { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
    { 'mtoohey31/cmp-fish', after = 'nvim-cmp' },
    { 'kdheepak/cmp-latex-symbols', after = 'nvim-cmp' },
    -- NOTE: may need after/requires constraints
    { 'hrsh7th/cmp-nvim-lsp', after = { 'nvim-lspconfig', 'nvim-cmp' } },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'saadparwaiz1/cmp_luasnip', after = { 'LuaSnip', 'nvim-cmp' } },

    { "David-Kunz/cmp-npm",
      requires = "nvim-lua/plenary.nvim", after = 'nvim-cmp',
      config = function() require('cmp-npm').setup() end, },
    { "saecki/crates.nvim",
      requires = "nvim-lua/plenary.nvim", after = 'nvim-cmp',
      config = function() require('crates').setup() end,
    },
  },
})

plugin({ 'L3MON4D3/LuaSnip', event = 'InsertEnter', config = conf.lua_snip }) -- friendly snippets?
