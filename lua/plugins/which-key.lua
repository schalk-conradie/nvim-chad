return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      -- Groups
      { "<leader>a", group = "Alpha/Dashboard", icon = "🏠" },
      { "<leader>9", group = "99 Agent", icon = "🤖" },
      { "<leader>c", group = "Code Actions", icon = "💻" },
      { "<leader>d", group = "Document", icon = "📄" },
      { "<leader>w", group = "Workspace", icon = "🌐" },
      { "<leader>r", group = "Rename", icon = "✏️" },
      { "<leader>t", group = "Toggle", icon = "🔧" },
      { "<leader>x", group = "Text Objects", icon = "📝" },
      { "<leader>l", group = "Lazy/LazyGit", icon = "🦥" },
      { "<leader>f", group = "Find/Files", icon = "🔍" },
      { "<leader>g", group = "Git", icon = "🌿" },
      { "<leader>b", group = "Buffer", icon = "📑" },
      { "<leader>h", group = "Help", icon = "❓" },

      -- LSP mappings (from nvim-lsp.lua)
      { "<leader>rn", desc = "Rename symbol" },
      { "<leader>ca", desc = "Code action" },
      { "<leader>cd", desc = "Show documentation" },
      { "<leader>cf", desc = "Format code" },
      { "<leader>ds", desc = "Document symbols" },
      { "<leader>ws", desc = "Workspace symbols" },
      { "<leader>th", desc = "Toggle inlay hints" },

      -- Goto mappings
      { "gd", desc = "Go to definition" },
      { "gD", desc = "Go to declaration" },
      { "gr", desc = "Go to references" },
      { "gI", desc = "Go to implementation" },
      { "gt", desc = "Go to type definition" },

      -- 99 Agent mappings (from 99.lua)
      { "<leader>9v", desc = "Visual replace with prompt" },
      { "<leader>9s", desc = "Stop requests" },
      { "<leader>9m", desc = "Cycle AI model" },
      { "<leader>9M", desc = "Select AI model" },

      -- LazyGit mapping (from lazygit.lua)
      { "<leader>lg", desc = "Open LazyGit" },

      -- Treesitter text objects (from treesitter.lua)
      { "<leader>xs", desc = "Swap with next parameter" },
      { "<leader>xS", desc = "Swap with previous parameter" },

      -- Oil mapping (from oil.lua)
      { "-", desc = "Open parent directory" },

      -- General mappings (from mappings.lua)
      { "<leader>ad", desc = "Open Alpha Dashboard" },
      { ";", desc = "Enter command mode" },
      { "jk", desc = "Exit insert mode" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show { global = false }
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
