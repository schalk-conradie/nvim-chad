return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    {
      "-",
      function()
        local cwd = vim.fn.getcwd()
        -- Handle PowerShell provider paths like "Microsoft.PowerShell.Core\FileSystem::\\Mac\Code"
        if cwd:match("^Microsoft%.PowerShell%.Core") then
          -- Extract the UNC path part
          local unc_path = cwd:match("::(.+)$")
          if unc_path then
            -- Normalize UNC path for Oil
            local oil_path = unc_path:gsub("\\", "/")
            require("oil").open(oil_path)
            return
          end
        end
        require("oil").open(cwd)
      end,
      desc = "Open parent directory",
    },
  },
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
