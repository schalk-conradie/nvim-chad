local options = {
  formatters_by_ft = {
    -- Lua
    lua = { "stylua" },
    -- Go
    go = { "gofumpt", "goimports" },
    -- TypeScript/JavaScript/TSX/JSX
    typescript = { "biome" },
    javascript = { "biome" },
    typescriptreact = { "biome" },
    javascriptreact = { "biome" },
    tsx = { "biome" },
    jsx = { "biome" },
    -- Python
    python = { "black", "isort" },
    -- Web
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
