require "nvchad.options"

local o = vim.o
local opt = vim.opt

o.cursorlineopt = 'both' -- to enable cursorline

-- Tab settings: use tabs with width 4
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = false -- use actual tabs, not spaces
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
