-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend some vim mode key defines in this file

local keymap = require('core.keymap')
local nmap, imap, cmap, xmap, tmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap, keymap.tmap
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
})

imap({
  -- insert mode
  { '<C-h>', '<Bs>', opts(noremap) },
  { '<C-e>', '<End>', opts(noremap) },
})

tmap({
  { '<M-h>', '<C-\\><C-n><C-w>h', opts(noremap) },
  { '<M-j>', '<C-\\><C-n><C-w>j', opts(noremap) },
  { '<M-k>', '<C-\\><C-n><C-w>k', opts(noremap) },
  { '<M-l>', '<C-\\><C-n><C-w>l', opts(noremap) },
  { '<C-o>', '<C-\\><C-n><C-o>', opts(noremap) },
  { '<C-q>', cmd('bd!'), opts(noremap) },
})

-- commandline remap
cmap({ '<C-b>', '<Left>', opts(noremap) })
