-- install plugins
require('plugins')

-- base config
require('base_config')

-- lsp/keymaps/language config
require('lua_lsp')
require('python')
require('rust')
require('keymap')

-- codecompanion
require('lmstudio')

-- theme
require('gruvbox')
vim.cmd('colorscheme gruvbox')

