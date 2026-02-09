return {
  "goolord/alpha-nvim",
  lazy = false,
  dependencies = { "nvim-mini/mini.icons" },
  config = function()
    local alpha = require "alpha"
    local startify = require "alpha.themes.startify"

    -------------------------------------------------------------------
    -- HELPER: Get recent projects (Telescope-Project Logic)
    -------------------------------------------------------------------
    local function mru_projects()
      local ok, project_utils = pcall(require, "telescope._extensions.project.utils")
      if not ok then
        return {}
      end

      local projects = project_utils.get_projects "recent"
      local buttons = {}

      for i, p in ipairs(projects) do
        if i > 5 then
          break
        end

        local display_path = p.path:gsub(vim.fn.expand "$HOME", "~")

        -- Generate button: [1] Project Name (Path)
        local button = startify.button(tostring(i + 10), "󱔗  " .. p.title .. " (" .. display_path .. ")", function()
          project_utils.change_project_dir(p.path, "cd")
          vim.cmd "edit ."
        end)

        table.insert(buttons, button)
      end
      return buttons
    end

    -------------------------------------------------------------------
    -- HELPER: Project-Specific MRU
    -------------------------------------------------------------------
    -- This function returns a table of buttons for files in the CURRENT directory only
    local function get_local_mru()
      return startify.mru(0, vim.fn.getcwd(), 9)
    end

    -------------------------------------------------------------------
    -- DEFINE SECTIONS
    -------------------------------------------------------------------

    -- 1. Header
    startify.section.header.val = {
      "          ▀████▀▄▄               ▄█ ",
      "            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ",
      "    ▄        █          ▀▀▀▀▄  ▄▀  ",
      "   ▄▀ ▀▄      ▀▄              ▀▄▀  ",
      "  ▄▀    █      █▀   ▄█▀▄      ▄█    ",
      "  ▀▄      ▀▄  █      ▀██▀     ██▄█   ",
      "   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ",
      "    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ",
      "   █   █  █       ▄▄            ▄▀   ",
    }

    -- 2. MRU (Redefined from scratch to fix title and filtering)
    startify.section.mru = {
      type = "group",
      val = {
        {
          type = "text",
          val = "Recent Files (Current Project)",
          opts = { hl = "SpecialComment", shrink_margin = false, position = "center" },
        },
        { type = "padding", val = 1 },
        {
          type = "group",
          val = function()
            return { get_local_mru() }
          end,
          opts = { shrink_margin = false },
        },
      },
    }

    -- 3. Projects List
    local project_buttons = mru_projects()

    -- Append the "Find Project" button at the bottom of the list
    if #project_buttons > 0 then
      table.insert(project_buttons, { type = "padding", val = 1 })
    end
    table.insert(
      project_buttons,
      startify.button("p", "  Find Project (Picker)", function()
        require("telescope").extensions.project.project {}
      end)
    )

    startify.section.projects = {
      type = "group",
      val = {
        {
          type = "text",
          val = "Recent Projects",
          opts = { hl = "SpecialComment", shrink_margin = false, position = "center" },
        },
        { type = "padding", val = 1 },
        { type = "group", val = project_buttons },
      },
    }

    -- 4. Bookmarks
    startify.section.bookmarks = {
      type = "group",
      val = {
        { type = "text", val = "Bookmarks", opts = { hl = "SpecialComment", position = "center" } },
        { type = "padding", val = 1 },
        startify.button("c", "Neovim Config", ":cd ~/.config/nvim-chad | e .<CR>"),
        startify.button("z", "Zsh Config", ":e ~/.zshrc<CR>"),
        startify.button("s", "SSH Config", ":e ~/.ssh/config<CR>"),
      },
    }

    -------------------------------------------------------------------
    -- LAYOUT
    -------------------------------------------------------------------
    startify.opts.margin = 20

    startify.config.layout = {
      { type = "padding", val = 2 },
      startify.section.header,
      { type = "padding", val = 2 },
      startify.section.top_buttons,
      { type = "padding", val = 2 },
      startify.section.mru, -- Using our redefined section
      { type = "padding", val = 2 },
      startify.section.projects, -- Using our redefined section
      { type = "padding", val = 2 },
      startify.section.bookmarks,
      { type = "padding", val = 2 },
      startify.section.bottom_buttons,
      { type = "padding", val = 2 },
      startify.section.footer,
    }

    alpha.setup(startify.config)
  end,
}
