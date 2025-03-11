return  {
    "pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({
        enabled = true,
        -- 保存のトリガー条件
        trigger_events = {
          "InsertLeave",            -- インサートモードを抜けたとき
          "TextChanged",            -- テキストが変更されたとき
          "TextChangedI",           -- インサートモード中にテキストが変更されたとき
          "TextChangedP",           -- 補完時にテキストが変更されたとき
          "CursorMoved",            -- カーソルが移動したとき
          "CursorMovedI",           -- インサートモード中にカーソルが移動したとき
        },
        -- debounce_delayを短くして即時保存に近づける
        debounce_delay = 50,
        -- 保存条件
        condition = function(buf)
          local fn = vim.fn
          local utils = require("auto-save.utils.data")

          if fn.getbufvar(buf, "&modifiable") == 1 and
              utils.not_in(fn.getbufvar(buf, "&filetype"), { "neo-tree", "lua.plugin", "terminal" }) then
            return true
          end
          return false
        end,
        -- 実行前の処理
        execution_message = {
          message = function()
            return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
          end,
          dim = 0.18,
          cleaning_interval = 1250,
        },
        -- 保存時のアニメーション
        write_all_buffers = false,
        callbacks = {
          enabling = nil,
          disabling = nil,
          before_asserting_save = nil,
          before_saving = nil,
          after_saving = nil,
        }
      })
    end
  }
