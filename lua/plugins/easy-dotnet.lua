return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap",
  },
  ft = { "cs", "csproj", "sln" },
  cmd = "Dotnet",
  config = function()
    require("easy-dotnet").setup({
      test_runner = {
        enable = true,
        viewmode = "float",
      },
    })
  end,
}
