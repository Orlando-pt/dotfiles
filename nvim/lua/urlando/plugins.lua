-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "nvim-tree/nvim-web-devicons", opts = {} },
    {
      "svrana/neosolarized.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("neosolarized").setup({
          comment_italics = true,
          background_set = false,
        })
        vim.cmd.colorscheme("neosolarized")
      end,
      dependencies = {
        "tjdevries/colorbuddy.nvim",
      },
    },
    { 'nvim-lualine/lualine.nvim',   dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { "L3MON4D3/LuaSnip",            version = "v2.*",                                build = "make install_jsregexp" },
    { 'onsails/lspkind.nvim' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'neovim/nvim-lspconfig' },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate"
    },
    { 'nvim-treesitter/nvim-treesitter-context' },
    { 'windwp/nvim-autopairs' },
    {
      'numToStr/Comment.nvim',
      opts = {
        toggler = {
          line = '<space>co'
        },
        opleader = {
          line = '<space>co'
        }
      }
    },
    { 'windwp/nvim-ts-autotag' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
    },

    { 'wakatime/vim-wakatime', lazy = false },
    { 'akinsho/bufferline.nvim', version = "v4.*", dependencies = 'nvim-tree/nvim-web-devicons' },
    {
      'rmagatti/auto-session',
      lazy = false,
      opts = {
        suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      }
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
