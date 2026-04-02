-- install plugins
require('plugins')

-- base config
require('base_config')

-- lsp/keymaps/language config
require('lua_lsp')
require('python')
require('rust')
require('keymap')

-- theme
require('gruvbox')
vim.cmd('colorscheme gruvbox')

