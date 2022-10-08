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
  'zig',
}

plugin({
  'neovim/nvim-lspconfig',
  config = conf.nvim_lsp,
  ft = filetypes,
})

plugin({
    "glepnir/lspsaga.nvim",
    config = function() require("lspsaga").init_lsp_saga() end,
})

plugin ({
  'jose-elias-alvarez/null-ls.nvim',
  config = conf.null_ls,
})

plugin({
  'github/copilot.vim',
  event = 'InsertEnter',
  setup = function()
    vim.cmd([[
      let g:copilot_no_tab_map = v:true
      imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")
    ]])
  end
})

plugin({
  'hrsh7th/nvim-cmp',
  config = conf.nvim_cmp,
  requires = {
    { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp', },
    { 'mtoohey31/cmp-fish', after = 'nvim-cmp' },
    -- NOTE: may need after/requires constraints
    { 'hrsh7th/cmp-nvim-lsp', after = { 'nvim-lspconfig', 'nvim-cmp' }, ft = filetypes },
    { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp', ft = filetypes },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'saadparwaiz1/cmp_luasnip', after = { 'LuaSnip', 'nvim-cmp' } },
  },
})

plugin({ 'L3MON4D3/LuaSnip', event = 'InsertEnter', requires = 'rafamadriz/friendly-snippets', config = conf.lua_snip }) -- friendly snippets?
