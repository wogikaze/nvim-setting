local cwd = vim.loop.cwd()

-------------------------------------------------
-- エディタの基本設定
-------------------------------------------------
-- 行の位置を把握しやすくする
vim.opt.number = true
vim.opt.relativenumber = true
-- 長い行を折り返さない（横スクロールで表示）
vim.opt.wrap = false
-- インデントの設定（4スペースをタブとして扱う）
vim.opt.tabstop = 4
-- vim.opt.lshiftwidth = 4
vim.opt.expandtab = true
-- カーソル位置を見やすくする
vim.opt.cursorline = true
-- モダンな配色を可能にする, 24bits color
vim.opt.termguicolors = true
-- OSのクリップボードと連携
vim.opt.clipboard = "unnamedplus"
-- 文字化けを防ぐ
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
-- 作業中のファイルを保護しない（git等で管理することを前提）
vim.opt.swapfile = false

-------------------------------------------------
-- キーマッピング（ショートカット）の設定
-------------------------------------------------

---Windowsのクリップボードに保存する
vim.keymap.set('v','<C-c>',":'<,'> w !/mnt/c/Windows/system32/clip.exe<CR>")


-------------------------------------------------
-- プラグインマネージャーの設定
-------------------------------------------------
-- lazy.nvimが存在しない場合はインストール
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
