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
    html = { "biome" },
    css = { "biome" },
    scss = { "biome" },
    json = { "biome" },
    yaml = { "biome" },
    markdown = { "biome" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters = {
    biome = {
      -- Use the = syntax to ensure the argument is parsed correctly
      args = { "check", "--write", "--format-with-errors=true", "--stdin-file-path", "$FILENAME" },
    },
  },
}

return options
