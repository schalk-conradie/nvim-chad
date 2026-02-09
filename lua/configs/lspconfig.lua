require("nvchad.configs.lspconfig").defaults()

local servers = {
  -- Web
  "html",
  "cssls",
  "tailwindcss",
  -- TypeScript (using typescript-tools instead)
  -- JavaScript
  "eslint",
  -- Go
  "gopls",
  -- Python
  "pyright",
  "ruff",
  -- Lua
  "lua_ls",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
