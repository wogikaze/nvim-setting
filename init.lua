-------------------------------------------------
-- キーマッピング（ショートカット）の設定
-------------------------------------------------
-- 'json'ファイルタイプに対するオートコマンドグループを作成
-- local json_group = vim.api.nvim_create_augroup("JsonAutoCmd", { clear = true })
--
-- -- 'json'ファイルタイプのバッファに対して<F5>キーのマッピングを設定
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "json",
--   group = json_group,
--   callback = function()
--     vim.api.nvim_buf_set_keymap(0, "n", "<F5>", [[:%!jq '.'<CR>]], { noremap = true, silent = true })
--   end,
-- })

-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"
