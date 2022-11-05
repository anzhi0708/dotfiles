require 'plugins'

vim.g.mapleader = ","
vim.o.number = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.relativenumber = true
vim.o.shortmess = "filnxtToOFI"
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.scrolloff = 9

local configs = require "lspconfig.configs"
local lspconfig = require 'lspconfig'

if not configs.lua_language_server then
    configs.lua_language_server = {
        default_config = {
            cmd = {'lua-language-server'},
            filetypes = {'lua'},
            init_options = {},
            root_dir = function(fname) return vim.fn.getcwd() end,
            autostart = true
        }
    }
end

-- Lua language server
lspconfig.lua_language_server.setup {}

-- Rust language server
lspconfig.rust_analyzer.setup {}

-- Python language server
if not configs.pylsp then
    configs.pylsp = {
        default_config = {
            cmd = {'pylsp'},
            filetypes = {'python'},
            init_options = {},
            root_dir = function(fname) return vim.fn.getcwd() end,
            autostart = true
        }
    }
end

lspconfig.pylsp.setup {}
