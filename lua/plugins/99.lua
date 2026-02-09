return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>9", group = "99 Agent", icon = "🤖" },
      },
    },
  },
  {
    "ThePrimeagen/99",
    event = "VeryLazy",
    config = function()
      local _99 = require "99"

      local models = {
        "github-copilot/gpt-5-mini",
        "github-copilot/claude-opus-4.5",
        "github-copilot/claude-sonnet-4.5",
        "synthetic/hf:MiniMaxAI/MiniMax-M2.1",
      }
      local current_model_idx = 4

      local cwd = vim.uv.cwd()
      local basename = vim.fs.basename(cwd)

      _99.setup {
        -- Use the list so setup is always in sync with the cycler
        model = models[current_model_idx],

        logger = {
          level = _99.DEBUG,
          path = "/tmp/" .. basename .. ".99.debug",
          print_on_error = true,
        },

        completion = {
          source = "cmp",
          cursor_rules = ".cursor/rules",
          custom_rules = {
            "scratch/custom_rules/",
          },
        },

        md_files = {
          "AGENT.md",
        },

        display_errors = true,
      }

      -- ============================================================
      -- Keymaps
      -- ============================================================

      vim.keymap.set("v", "<leader>9v", function()
        _99.visual_prompt()
      end, { desc = "99: Visual Replace with Prompt" })

      vim.keymap.set({ "n", "v" }, "<leader>9s", function()
        _99.stop_all_requests()
        print "99: Requests stopped"
      end, { desc = "99: Stop Requests" })

      -- ============================================================
      -- Cycle Models Window
      -- ============================================================
      vim.keymap.set("n", "<leader>9m", function()
        -- Cycle the index
        current_model_idx = (current_model_idx % #models) + 1
        local new_model = models[current_model_idx]

        -- Update the plugin state
        _99.set_model(new_model)

        -- UI: Show notification using standard vim.notify
        vim.notify("Switched to: " .. new_model, vim.log.levels.INFO, { title = "99 Agent" })
      end, { desc = "99: Cycle AI Model" })

      -- Select Model from Menu (<leader>9M)
      -- If you forget the order, this pops up a selection list
      vim.keymap.set("n", "<leader>9M", function()
        vim.ui.select(models, {
          prompt = "Select 99 Model:",
          format_item = function(item)
            -- Add a marker for the currently active model
            return (item == models[current_model_idx] and "* " or "  ") .. item
          end,
        }, function(choice, idx)
          if choice then
            current_model_idx = idx
            _99.set_model(choice)
            vim.notify("Switched to: " .. choice, vim.log.levels.INFO, { title = "99 Agent" })
          end
        end)
      end, { desc = "99: Select AI Model" })
    end,
  },
}
