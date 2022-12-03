-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend some vim mode key defines in this file

local keymap = require('core.keymap')
local nmap, imap, xmap = keymap.nmap, keymap.imap, keymap.xmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = ' '

-- leaderkey
nmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

-- usage example
nmap({
  -- noremal remap
  -- save
  { '<C-s>', cmd('write'), opts(noremap) },
  -- yank
  { 'Y', 'y$', opts(noremap, silent) },
  -- remove trailing white space
  -- { '<Leader>tw', cmd('TrimTrailingWhitespace'), opts(noremap) },
  -- buffer stuff
  { '<C-q>', cmd('q!'), opts(noremap) },
  { '<Leader>bd', cmd('bd!'), opts(noremap) },
  -- window jump
  { '<M-h>', '<C-w>h', opts(noremap, silent) },
  { '<M-l>', '<C-w>l', opts(noremap, silent) },
  { '<M-j>', '<C-w>j', opts(noremap, silent) },
  { '<M-k>', '<C-w>k', opts(noremap, silent) },
  -- cd maps
  { '<Leader>cd', cmd('cd %:p:h'), opts(noremap) },
  { '<Leader>..', cmd('cd ..'), opts(noremap) },
  -- page jump then center
  { '<C-u>', '<C-u>zz', opts(silent) },
  { '<C-d>', '<C-d>zz', opts(silent) },
})

imap({
  -- insert mode
  { '<C-e>', '<End>', opts(noremap) },
})
