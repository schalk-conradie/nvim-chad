return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      fuzzy = { implementation = "prefer_rust_with_warning" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "easy-dotnet" },
        providers = {
          ["easy-dotnet"] = {
            name = "easy-dotnet",
            module = "easy-dotnet.completion.blink",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
}
