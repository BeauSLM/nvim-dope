local codelldb = {}
local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
codelldb.bin_path = extension_path .. 'adapter/codelldb'
codelldb.lib_path = extension_path .. 'lldb/lib/liblldb.so'

return codelldb
