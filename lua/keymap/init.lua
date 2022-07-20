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
  { '<Leader>fg', cmd('Telescope git_files'), opts(noremap, silent) },
  { '<Leader>fm', cmd('Telescope man_pages'), opts(noremap, silent) },
  { '<Leader>fv', cmd('Telescope vim_options'), opts(noremap, silent) },
  { '<Leader>fh', cmd('Telescope help_tags'), opts(noremap, silent) },
  { '<Leader>fk', cmd('Telescope keymaps'), opts(noremap, silent) },
  { '<Leader>fz', cmd('Telescope zoxide list'), opts(noremap, silent) },
  -- Telescope lsp
  { 'gd', cmd('Telescope lsp_definitions'), opts(noremap, silent) },
  { '<leader>D', cmd('Telescope lsp_type_definitions'), opts(noremap, silent) },
  { 'gr', cmd('Telescope lsp_references'), opts(noremap, silent) },
  { '<Leader>gi', cmd('Telescope lsp_incoming_calls'), opts(noremap, silent) },
  { '<Leader>go', cmd('Telescope lsp_outgoing_calls'), opts(noremap, silent) },
  { 'gi', cmd('Telescope lsp_implementations'), opts(noremap, silent) },
  { '<leader>ds', cmd('Telescope lsp_document_symbols'), opts(noremap, silent) },
  { '<leader>dt', cmd('Telescope treesitter'), opts(noremap, silent) },
  { '<leader>ws', cmd('Telescope lsp_workspace_symbols'), opts(noremap, silent) },
  { '<leader>wd', cmd('Telescope diagnostics'), opts(noremap, silent) },
  -- { '<leader>fd', cmd('lua require("telescope.builtin").diagnostics { bufnr = 0 }'), opts(noremap, silent) },
  -- { '<Leader>ps', cmd('lua require("telescope.builtin").g{ search = vim.fn.input("Grep For > ")}}rep_string({ search = vim.fn.input("Grep For > ")})'), opts(noremap) },
  -- Maximizer
  { '<Leader>m', cmd('MaximizerToggle!'), opts(noremap, silent) },
  -- git
  { '<Leader>gs', cmd('Git'), opts(noremap, silent) },
  { '<Leader>gd', cmd('DiffviewOpen'), opts(noremap, silent) },
  { '<Leader>gl', cmd('GV'), opts(noremap, silent) },
  { '<Leader>gv', cmd('GV!'), opts(noremap, silent) },
  { '<Leader>gp', cmd('GV --patch'), opts(noremap, silent) },
  -- harpoon
  { '<Leader>a', cmd('lua require("harpoon.mark").toggle_file()'), opts(noremap, silent) },
  { '<Leader>h', cmd('lua require("harpoon.ui").toggle_quick_menu()'), opts(noremap, silent) },
  { '<Leader>y', cmd('lua require("harpoon.cmd-ui").toggle_quick_menu()'), opts(noremap, silent) },
  { '<Leader>j', cmd('lua require("harpoon.ui").nav_file(1)'), opts(noremap, silent) },
  { '<Leader>k', cmd('lua require("harpoon.ui").nav_file(2)'), opts(noremap, silent) },
  { '<Leader>l', cmd('lua require("harpoon.ui").nav_file(3)'), opts(noremap, silent) },
  { '<Leader>;', cmd('lua require("harpoon.ui").nav_file(4)'), opts(noremap, silent) },
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
  -- bufferline
  { '<Leader>bb', cmd('BufferLinePick'), opts(noremap, silent) },
  { '<Leader>bn', cmd('BufferLineCycleNext'), opts(noremap, silent) },
  { '<Leader>bp', cmd('BufferLineCyclePrev'), opts(noremap, silent) },
  { '<Leader>b>', cmd('BufferLineMoveNext'), opts(noremap, silent) },
  { '<Leader>b<', cmd('BufferLineMovePrev'), opts(noremap, silent) },
  { '<Leader>1', cmd('BufferLineGoToBuffer 1'), opts(noremap, silent) },
  { '<Leader>2', cmd('BufferLineGoToBuffer 2'), opts(noremap, silent) },
  { '<Leader>3', cmd('BufferLineGoToBuffer 3'), opts(noremap, silent) },
  { '<Leader>4', cmd('BufferLineGoToBuffer 4'), opts(noremap, silent) },
  { '<Leader>5', cmd('BufferLineGoToBuffer 5'), opts(noremap, silent) },
  -- vim operator surround
  { 'ma', '<Plug>(operator-surround-append)', opts(noremap, silent) },
  { 'md', '<Plug>(operator-surround-delete)', opts(noremap, silent) },
  { 'mr', '<Plug>(operator-surround-replace)', opts(noremap, silent) },
  -- lspsaga
  { '<Leader>ca', cmd('Lspsaga code_action'), opts(noremap, silent) },
  -- { 'K', cmd('Lspsaga hover_doc'), opts(silent) },
  -- { '<C-k>', cmd('Lspsaga signature_help'), opts(noremap, silent) },
  { '<C-f>', cmd('lua require("lspsaga.action").smart_scroll_with_saga(1)'), opts(silent) },
  { '<C-b>', cmd('lua require("lspsaga.action").smart_scroll_with_saga(-1)'), opts(silent) },
  { '<leader>rn', cmd('Lspsaga rename'), opts(noremap, silent) },
  { '<leader>pd', cmd('Lspsaga preview_definition'), opts(silent) },
  { '<leader>pr', cmd('Lspsaga lsp_finder'), opts(noremap, silent) },
  { ']d', cmd('Lspsaga diagnostic_jump_next'), opts(noremap, silent) },
  { '[d', cmd('Lspsaga diagnostic_jump_prev'), opts(noremap, silent) },
  { '[d', cmd('Lspsaga diagnostic_jump_prev'), opts(noremap, silent) },
  { '<M-d>', cmd('Lspsaga open_floaterm'), opts(noremap, silent) },
})

vmap({
  -- gv
  { '<Leader>gl', cmd('GV'), opts(noremap, silent) },
  { '<Leader>gv', cmd('GV!'), opts(noremap, silent) },
  { '<Leader>gp', cmd('GV --patch'), opts(noremap, silent) },
  -- lspsaga
  { '<Leader>ca', cmd('<C-U>Lspsaga range_code_action'), opts(noremap, silent) },
})
