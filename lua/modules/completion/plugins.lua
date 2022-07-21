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

plugin({ 'windwp/nvim-autopairs', after = 'nvim-cmp', config = conf.autopairs })

plugin({
    "glepnir/lspsaga.nvim",
    config = function() require("lspsaga").init_lsp_saga() end,
})

plugin {
  'ray-x/navigator.lua',
  disable = true,
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
}

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
    { 'kdheepak/cmp-latex-symbols', after = 'nvim-cmp', ft = 'tex' },
    -- NOTE: may need after/requires constraints
    { 'hrsh7th/cmp-nvim-lsp', after = { 'nvim-lspconfig', 'nvim-cmp' }, ft = filetypes },
    { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp', ft = filetypes },
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
