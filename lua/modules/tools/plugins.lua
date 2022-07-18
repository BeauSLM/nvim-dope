-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin('nvim-lua/plenary.nvim')

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
  'gigablaster/rust-tools.nvim', -- TODO: go back to original when https://github.com/simrat39/rust-tools.nvim/issues/157 is fixed
  requires = 'nvim-lua/plenary.nvim',
  ft = 'rust',
  config = conf.rust_tools,
})

plugin({
  'p00f/clangd_extensions.nvim',
  ft = { 'c', 'cpp' },
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

plugin ({
  'thePrimeagen/harpoon',
  requires = 'nvim-lua/plenary.nvim',
})

plugin 'mg979/vim-visual-multi'

plugin 'tpope/vim-fugitive'

plugin ({ 'junegunn/gv.vim', requires = 'vim-fugitive' })

plugin ({ 'tpope/vim-rhubarb', requires = 'vim-fugitive' })

plugin ({ 'shumphrey/fugitive-gitlab.vim', requires = 'vim-fugitive' })

plugin ({
  'sindrets/diffview.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = function()
    require('diffview').setup { use_icons = false, }
  end,
})

plugin ({
  'lewis6991/gitsigns.nvim',
  disable = true,
  config = function()
    require('gitsigns').setup()
  end
})

