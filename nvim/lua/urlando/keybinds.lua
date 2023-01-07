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
nnoremap("<leader>p", "\"0p")

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
nnoremap("<leader>tr", "<C-w>>")
nnoremap("<leader>tl", "<C-w><")
nnoremap("<leader>tu", "<C-w>+")
nnoremap("<leader>td", "<C-w>-")

-- lsp configs
nnoremap("<leader>ne", ":lua vim.lsp.diagnostic.goto_next()<CR>")
nnoremap("<leader>pe", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
nnoremap("gv", ":vsplit | lua vim.lsp.buf.definition()<CR>")

-- format document
nnoremap("<leader>fo", ":lua vim.lsp.buf.format()<CR>")
