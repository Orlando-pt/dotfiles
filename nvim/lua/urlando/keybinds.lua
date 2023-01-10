local Remap = require("urlando.keymap")
local vnoremap = Remap.vnoremap
local nnoremap = Remap.nnoremap
local xnoremap = Remap.xnoremap
local inoremap = Remap.inoremap

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap("Y", "yg$")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- greatest remap ever
-- pastes an
-- xnoremap("<leader>p", "\"_dP")
nnoremap("<leader>pp", "\"0p")

-- next greatest remap ever : asbjornHaland
-- nnoremap("<leader>y", "\"+y")
-- vnoremap("<leader>y", "\"+y")
-- nmap("<leader>Y", "\"+Y")
--
-- nnoremap("<leader>d", "\"_d")
-- vnoremap("<leader>d", "\"_d")
--
-- vnoremap("<leader>d", "\"_d")

-- This is going to get me cancelled
inoremap("<C-c>", "<Esc>")

-- Increment/decrement
nnoremap("+", "<C-a>")
nnoremap("-", "<C-x>")

-- Manage tabs
nnoremap("<leader>sv", "<C-w>v")
nnoremap("<leader>sh", ":split<Return>")

-- Move tabs
nnoremap("<leader>h", "<C-w>h")
nnoremap("<leader>j", "<C-w>j")
nnoremap("<leader>k", "<C-w>k")
nnoremap("<leader>l", "<C-w>l")

-- Resize tabs
nnoremap("<leader>th", ":vertical resize +5<CR>")
nnoremap("<leader>tl", ":vertical resize -5<CR>")
nnoremap("<leader>tk", ":resize +5<CR>")
nnoremap("<leader>tj", ":resize -5<CR>")

-- Reload keybinds
nnoremap("<leader>rc", ":luafile ~/.config/nvim/lua/urlando/keybinds.lua<CR>")

-- lsp configs
nnoremap("<leader>ne", ":lua vim.lsp.diagnostic.goto_next()<CR>")
nnoremap("<leader>pe", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
nnoremap("gv", ":vsplit | lua vim.lsp.buf.definition()<CR>")

-- format document
nnoremap("<leader>fo", ":lua vim.lsp.buf.format()<CR>")
