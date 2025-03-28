return {
  "pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup {
      enabled = true,
      trigger_events = {
        "InsertLeave",
        "TextChanged",
        "TextChangedI",
        "TextChangedP",
        "CursorMoved",
        "CursorMovedI",
      },
      debounce_delay = 50,
      condition = function(buf)
        local fn = vim.fn
        local utils = require "auto-save.utils.data"

        if
          fn.getbufvar(buf, "&modifiable") == 1
          and utils.not_in(fn.getbufvar(buf, "&filetype"), { "neo-tree", "lua.plugin", "terminal" })
        then
          return true
        end
        return false
      end,
      execution_message = {
        message = function() return ("AutoSave: saved at " .. vim.fn.strftime "%H:%M:%S") end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      write_all_buffers = false,
      callbacks = {
        enabling = nil,
        disabling = nil,
        before_asserting_save = nil,
        before_saving = nil,
        after_saving = nil,
      },
    }
  end,
}
