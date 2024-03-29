local Remap = require("urlando.keymap")
local vnoremap = Remap.vnoremap
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local noremap = Remap.nmap
local xnoremap = Remap.xnoremap

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap("Y", "yg$")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")


-- Do not loose selection when indenting
vnoremap("<", "<gv")
vnoremap(">", ">gv")

inoremap("<Esc><BS>", "<C-w>")

-- Close tab
nnoremap("<leader>Q", ":qa<CR>")
nnoremap("<leader>W", ":wa<CR>")

-- Move to start/end of line
noremap("<leader>E", "$")
noremap("<leader>I", "^")

-- Close last buffer
nnoremap("<leader>q", ":b# | :bd#<CR>")

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
nnoremap("<leader>su", "<C-w>v")
nnoremap("<leader>sh", ":split<Return>")

-- Move tabs
nnoremap("<leader>h", "<C-w>h")
nnoremap("<leader>j", "<C-w>j")
nnoremap("<leader>k", "<C-w>k")
nnoremap("<leader>l", "<C-w>l")

-- Resize tabs
nnoremap("<C-H>", ":vertical resize +5<CR>")
nnoremap("<C-L>", ":vertical resize -5<CR>")
nnoremap("<C-K>", ":resize +5<CR>")
nnoremap("<C-J>", ":resize -5<CR>")

-- Reload keybinds
nnoremap("<leader>rc", ":luafile ~/.config/nvim/lua/urlando/keybinds.lua<CR>")

-- lsp configs
nnoremap("<leader>ne", ":lua vim.diagnostic.goto_next()<CR>")
nnoremap("<leader>pe", ":lua vim.diagnostic.goto_prev()<CR>")
nnoremap("<leader>ee", ":lua vim.diagnostic.open_float()<CR>")
nnoremap("gs", ":vsplit | lua vim.lsp.buf.definition()<CR>")
nnoremap("gS", ":split | lua vim.lsp.buf.definition()<CR>")

-- format document
nnoremap("<leader>fo", ":lua vim.lsp.buf.format()<CR>")

-- Telescope diagnostic
nnoremap("<leader>ed", ":Telescope diagnostics<CR>")

-- now it is possible to paste many times over selected text
xnoremap("<leader>pp", "\"_dP")

