-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

return require('packer').startup({
  function(use)
    ---------------------
    -- Package Manager --
    ---------------------

    use('wbthomason/packer.nvim')

    use 'kyazdani42/nvim-web-devicons'
    use {
      'svrana/neosolarized.nvim',
      lazy = false,
      priority = 1000,
      config = function()
        require("neosolarized").setup({
          comment_italics = true,
          background_set = false,
        })
        vim.cmd.colorscheme("neosolarized")
      end,
      requires = { 'tjdevries/colorbuddy.nvim' }
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim',
      run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- lsp configs
    use 'L3MON4D3/LuaSnip'
    use('onsails/lspkind.nvim')  -- vscode like pictograms
    use 'hrsh7th/cmp-buffer'     -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp'   -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/nvim-cmp'       -- Completion
    use('neovim/nvim-lspconfig') -- Configurations for Nvim LSP

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }

    use 'nvim-treesitter/nvim-treesitter-context'

    use 'windwp/nvim-autopairs'
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup({
          toggler = {
            line = '<space>co'
          },
          opleader = {
            line = '<space>co'
          }
        })
      end
    }
    use 'windwp/nvim-ts-autotag'

    -- telescope stuff
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'

    -- wakatime
    use 'wakatime/vim-wakatime'

    -- copilot
    use 'github/copilot.vim'

    -- bufferline
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }

    -- maintain sessions
    use {
      'rmagatti/auto-session',
      config = function()
        require("auto-session").setup {
          suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        }
      end
    }
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
    },
  },
})
