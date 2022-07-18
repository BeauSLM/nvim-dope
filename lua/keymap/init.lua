-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend plugins key defines in this file

require('keymap.config')
local key = require('core.keymap')
local nmap = key.nmap
local vmap = key.vmap
local silent, noremap = key.silent, key.noremap
local opts = key.new_opts
local cmd = key.cmd

-- usage of plugins
nmap({
  -- packer
  { '<Leader>pu', cmd('PackerUpdate'), opts(noremap, silent) },
  { '<Leader>pi', cmd('PackerInstall'), opts(noremap, silent) },
  { '<Leader>pc', cmd('PackerCompile'), opts(noremap, silent) },
  -- dashboard
  { '<Leader>n', cmd('DashboardNewFile'), opts(noremap, silent) },
  { '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
  { '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) },
  -- nvimtree
  { '<Leader>e', cmd('NvimTreeToggle'), opts(noremap, silent) },
  -- Telescope
  { '<Leader>bf', cmd('Telescope buffers'), opts(noremap, silent) },
  { '<Leader>fa', cmd('Telescope live_grep'), opts(noremap, silent) },
  { '<Leader>fs', cmd('Telescope find_files'), opts(noremap, silent) },
  { '<Leader>fg', cmd('Telescope find_files'), opts(noremap, silent) },
  { '<Leader>fm', cmd('Telescope man_pages'), opts(noremap, silent) },
  { '<Leader>fv', cmd('Telescope vim_options'), opts(noremap, silent) },
  { '<Leader>fk', cmd('Telescope keymaps'), opts(noremap, silent) },
  { '<Leader>fz', cmd('Telescope zoxide list'), opts(noremap, silent) },
  -- { '<Leader>ps', cmd('lua require("telescope.builtin").g{ search = vim.fn.input("Grep For > ")}}rep_string({ search = vim.fn.input("Grep For > ")})'), opts(noremap) },
  -- Maximizer
  { '<Leader>m', cmd('MaximizerToggle!'), opts(noremap, silent) },
  -- fugitive
  { '<Leader>gs', cmd('Git'), opts(noremap, silent) },
  { '<Leader>gd', cmd('DiffviewOpen'), opts(noremap, silent) },
  { '<Leader>gl', cmd('GV'), opts(noremap, silent) },
  { '<Leader>gv', cmd('GV!'), opts(noremap, silent) },
  { '<Leader>gp', cmd('GV --patch'), opts(noremap, silent) },
  -- harpoon
  { '<Leader>a', cmd('lua require("harpoon.mark").toggle_file()'), opts(noremap, silent) },
  { '<Leader>ht', cmd('lua require("harpoon.ui").toggle_quick_menu()'), opts(noremap, silent) },
  { '<Leader>y', cmd('lua require("harpoon.cmd-ui").toggle_quick_menu()'), opts(noremap, silent) },
  { '<Leader>hj', cmd('lua require("harpoon.ui").nav_file(1)'), opts(noremap, silent) },
  { '<Leader>hk', cmd('lua require("harpoon.ui").nav_file(2)'), opts(noremap, silent) },
  { '<Leader>tj', cmd('lua require("harpoon.term").gotoTerminal(1)') .. 'A', opts(noremap, silent) },
  { '<Leader>tk', cmd('lua require("harpoon.term").gotoTerminal(2)') .. 'A', opts(noremap, silent) },
  { '<Leader>tl', cmd('lua require("harpoon.term").gotoTerminal(3)') .. 'A', opts(noremap, silent) },
  { '<Leader>t;', cmd('lua require("harpoon.term").gotoTerminal(4)') .. 'A', opts(noremap, silent) },
  -- dap
  { '<Leader>dl', cmd('DapContiue'), opts(noremap, silent) },
  { '<Leader>dk', cmd('DapStepOver'), opts(noremap, silent) },
  { '<Leader>dj', cmd('DapStepInto'), opts(noremap, silent) },
  { '<Leader>dh', cmd('DapStepOut'), opts(noremap, silent) },
  { '<Leader>db', cmd('DapToggleBreakpoint'), opts(noremap, silent) },
  { '<Leader>dB', cmd('lua require("dap").set_breakpoint(vin.fn.input("Breakpoint condition: "))'), opts(noremap, silent) },
  -- { '<Leader>dr', cmd('lua require("dap").repl.open()'), opts(noremap, silent) },
  { '<Leader>drl', cmd('lua require("dap").run_last()'), opts(noremap, silent) },
  { '<Leader>dc', cmd('DapTerminate'), opts(noremap, silent) },
})

vmap({
  { '<Leader>gl', cmd('GV'), opts(noremap, silent) },
  { '<Leader>gv', cmd('GV!'), opts(noremap, silent) },
  { '<Leader>gp', cmd('GV --patch'), opts(noremap, silent) },
})
