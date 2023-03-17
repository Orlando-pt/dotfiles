local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-c>"] = actions.close
      },
      n = {
        ["<C-c>"] = actions.close
      },
    },
    file_ignore_patterns = { "node_modules" }
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["R"] = fb_actions.rename,
          ["Y"] = fb_actions.copy,
          ["D"] = fb_actions.remove,
          ["h"] = fb_actions.goto_parent_dir,
          ["H"] = fb_actions.goto_cwd,
          ["/"] = function()
            vim.cmd('startinsert')
          end,
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

vim.keymap.set('n', '<C-p>',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
vim.keymap.set('n', '<leader>gu', function()
  builtin.lsp_references()
end)
vim.keymap.set('n', '<leader>ff',
  function()
    builtin.git_files()
  end)
vim.keymap.set('n', '<leader>gl', function()
  builtin.live_grep()
end)
vim.keymap.set('n', '<M-p>', function()
  builtin.buffers()
end)
vim.keymap.set('n', '<leader>;;', function()
  builtin.resume()
end)
vim.keymap.set("n", "<leader>ep", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)
