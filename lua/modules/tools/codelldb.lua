local codelldb = {}
local extension_path = vim.env.HOME .. '/.vscode-oss/extensions/vadimcn.vscode-lldb-1.7.2/'
codelldb.bin_path = extension_path .. 'adapter/codelldb'
codelldb.lib_path = extension_path .. 'lldb/lib/liblldb.so'

return codelldb
