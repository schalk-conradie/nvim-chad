return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-project.nvim",
  },
  config = function()
    local telescope = require "telescope"

    telescope.setup {
      defaults = {
        -- Telescope defaults
        path_display = { "truncate" },
        file_ignore_patterns = { "%.git/" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      hidden_files = true,
      extensions = {
        project = {
          base_dirs = {
            "~/Code/",
            { path = "~/Code/work", max_depth = 4 },
            { path = "~/Code/personal/", max_depth = 4 },
          },
          defaults = {},
          hidden_files = false,
          theme = "dropdown",
          order_by = "recent",
          search_by = "title",
          sync_with_nvim_tree = false, -- if you use nvim-tree
        },
      },
    }

    -- Essential: Load the extension after setup
    telescope.load_extension "project"
  end,
}
