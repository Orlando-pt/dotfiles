-- vip.opt.termguicolors = true

local bufferline = require("bufferline")
bufferline.setup {
  options = {
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(_, _, diagnostics_dict, _)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
            or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
    show_buffer_close_icons = false,
  }
}

for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    bufferline.go_to_buffer(i, true)
  end)
end

vim.keymap.set("n", "<leader>wl", function()
  bufferline.cycle(1)
end)

vim.keymap.set("n", "<leader>wh", function()
  bufferline.cycle(-1)
end)
