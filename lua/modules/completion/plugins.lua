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
  'rust',
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
  'nim',
  'latex',
}

plugin({ 'windwp/nvim-autopairs', after = 'nvim-cmp', config = conf.autopairs })

plugin {
  'ray-x/navigator.lua',
  requires = {
    { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
    'neovim/nvim-lspconfig',
    'ray-x/lsp_signature.nvim',
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
  event = 'InsertEnter',
  config = conf.nvim_cmp,
  requires = {
    { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp', },
    { 'mtoohey31/cmp-fish', after = 'nvim-cmp' },
    { 'kdheepak/cmp-latex-symbols', after = 'nvim-cmp', ft = 'tex' },
    -- NOTE: may need after/requires constraints
    { 'hrsh7th/cmp-nvim-lsp', after = { 'nvim-lspconfig', 'nvim-cmp' }, ft = filetypes },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'saadparwaiz1/cmp_luasnip', after = { 'LuaSnip', 'nvim-cmp' } },

    { "David-Kunz/cmp-npm", disable = true,
      requires = "nvim-lua/plenary.nvim", after = 'nvim-cmp',
      config = function() require('cmp-npm').setup() end,
      ft = 'json',
    },
    { "saecki/crates.nvim", disable = true,
      requires = "nvim-lua/plenary.nvim", after = 'nvim-cmp',
      config = function()
        require('crates').setup({ null_ls = { enabled = true, name = "crates.nvim"} })
      end,
      ft = 'json'
    },
  },
})

plugin({ 'L3MON4D3/LuaSnip', event = 'InsertEnter', requires = 'rafamadriz/friendly-snippets', config = conf.lua_snip }) -- friendly snippets?
