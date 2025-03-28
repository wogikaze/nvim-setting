return {
  {
    "EtiamNullam/deferred-clipboard.nvim",
    event = "VeryLazy",
    config = function()
      require("deferred-clipboard").setup {
        fallback = "unnamedplus",
        lazy = true,
      }

      vim.g.clipboard = {
        name = "clip",
        copy = {
          ["+"] = "win32yank.exe -i --crlf",
          ["*"] = "win32yank.exe -i --crlf",
        },
        paste = {
          ["+"] = "win32yank.exe -o --lf",
          ["*"] = "win32yank.exe -o --lf",
        },
        cache_enable = 0, -- Disable clipboard caching
      }
    end,
  },
}
