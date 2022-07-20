-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local config = {}

function config.telescope()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd([[packadd plenary.nvim]])
    vim.cmd([[packadd popup.nvim]])
    vim.cmd([[packadd telescope-fzy-native.nvim]])
    vim.cmd([[packadd telescope-file-browser.nvim]])
  end
  require('telescope').setup({
    defaults = {
      layout_config = {
        horizontal = { prompt_position = 'top', results_width = 0.6 },
        vertical = { mirror = false },
      },
      sorting_strategy = 'ascending',
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
  })
  require('telescope').load_extension('fzy_native')
end

function config.dap()
  local dap = require('dap')
  local codelldb_path = require('modules.tools.codelldb').bin_path
  dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
      command = codelldb_path,
      args = {"--port", "${port}"},
    }
  }
  dap.configurations.c = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = true,
    },
  }
  dap.configurations.cpp = dap.configurations.c
end

function config.dapui()
  local dap, dapui = require("dap"), require("dapui")
  dapui.setup()
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

function config.rust_tools()
  local codelldb = require('modules.tools.codelldb')
  require('rust-tools').setup({
    dap = {
      adapter = require('rust-tools.dap').get_codelldb_adapter(
        codelldb.bin_path, codelldb.lib_path)
    },
    server = { on_attach = require('modules.completion.lsp').on_attach, }
  })
end

function config.clangd_extensions()
  require("clangd_extensions").setup {
    server = { on_attach = require('modules.completion.lsp').on_attach, }
  }
  require('cmp').setup { sorting = { comparators = { require('clangd_extensions.cmp_scores') } } }
end

return config
