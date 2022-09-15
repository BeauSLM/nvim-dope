-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

plugin ({ 'sainnhe/gruvbox-material', config = conf.gruvbox, })

plugin({ 'glepnir/dashboard-nvim', config = conf.dashboard })

plugin({
  'windwp/windline.nvim',
  config = function() require('wlsample.evil_line') end
})

plugin({
  'kyazdani42/nvim-tree.lua',
  cmd = 'NvimTreeToggle',
  config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons',
})

-- This may explode everything with fugitive, kill if it does
plugin({ 'akinsho/nvim-bufferline.lua', config = conf.nvim_bufferline, requires = 'kyazdani42/nvim-web-devicons' })

plugin({
  'lukas-reineke/indent-blankline.nvim',
  after = 'nvim-treesitter',
  config = conf.blankline,
})
