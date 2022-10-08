-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    { 'nvim-lua/popup.nvim', opt = true },
    { 'nvim-lua/plenary.nvim', opt = true },
    'nvim-telescope/telescope-fzy-native.nvim',
  },
})

plugin ({
  'simrat39/rust-tools.nvim',
  requires = { 'nvim-lua/plenary.nvim', opt = true },
  ft = 'rust',
  after = 'nvim-lspconfig',
  config = conf.rust_tools,
})

plugin({
  'p00f/clangd_extensions.nvim',
  ft = { 'c', 'cpp' },
  after = { 'nvim-cmp', 'nvim-lspconfig' },
  config = conf.clangd_extensions,
})

plugin ({
  'mfussenegger/nvim-dap',
  config = conf.dap,
})

plugin ({
  'rcarriga/nvim-dap-ui',
  requires = 'mfussenegger/nvim-dap',
  config = conf.dapui
})

plugin ({
  'theHamsta/nvim-dap-virtual-text',
  requires = { 'mfussenegger/nvim-dap', 'nvim-treesitter' },
  config = function()
    require('nvim-dap-virtual-text').setup()
  end
})

plugin ({
  'szw/vim-maximizer',
  config = function()
    vim.g.maximizer_set_default_mapping = 0
  end
})

plugin 'rhysd/committia.vim'

plugin 'mg979/vim-visual-multi'

plugin 'tpope/vim-eunuch'

plugin({ 'rhysd/vim-operator-surround', event = 'BufRead', requires = 'kana/vim-operator-user' })
