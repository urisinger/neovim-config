---@type ChadrcConfig
local M = {}

local create_autocmd = vim.api.nvim_create_autocmd


create_autocmd({ "UIEnter" }, {
  callback = function()
    local handle = io.popen "pgrep nvim | wc -l"
    if handle then
    local output = handle:read "*a"
    handle:close()
    if tonumber(output) == 2 then
      require("lazy").load {
        plugins = {
          "presence.nvim",

        },
      }
    end

    end
  end,
})

M.ui = { theme = 'chocolate'}
M.plugins = "custom.plugins"

return M
