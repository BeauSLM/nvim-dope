-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.lang.config')

plugin({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  -- after = 'telescope.nvim',
  config = conf.nvim_treesitter,
})

plugin({
  'windwp/nvim-ts-autotag',
  disable = true,
  after = 'nvim-treesitter',
  config = function()
    require('nvim-ts-autotag').setup()
  end,
})

plugin ({
  'numToStr/Comment.nvim',
  -- use after instead?
  requires = 'JoosepAlviste/nvim-ts-context-commentstring',
  config = conf.comment,
})

plugin({
  'JoosepAlviste/nvim-ts-context-commentstring',
  after = 'nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup { context_commentstring = { enable = true, enable_autocmd = false, } }
  end
})

plugin({
  'abecodes/tabout.nvim',
  after = 'nvim-treesitter',
  config = function()
    require('tabout').setup({
      completion = false,
    })
  end,
})

plugin({ 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' })
plugin({ 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' })
