-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local env = vim.env

opt.guifont = jit.os == "Windows" and "Iosevka SS03,Iosevka Nerd Font:h12"
  or jit.os == "OSX" and "MonaspiceNe Nerd Font:h16"
  or "Iosevka SS09,Iosevka Nerd Font:" .. (env.XDG_CURRENT_DESKTOP == "Hyprland" and "h21" or "h12")

opt.shell = jit.os == "Windows" and "nu" or opt.shell
opt.shellcmdflag = jit.os == "Windows" and "-c" or opt.shellcmdflag
opt.shellxquote = jit.os == "Windows" and "" or opt.shellxquote
