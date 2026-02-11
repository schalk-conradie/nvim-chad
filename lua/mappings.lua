require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>ad", "<cmd>Alpha<cr>", { desc = "Open Alpha Dashboard" })
map("n", "-", "<cmd>Oil<cr>", { desc = "Open Oil (Explorer)" })
