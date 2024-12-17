local M = {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  dependencies = { 'nvim-lua/plenary.nvim' }
}

function M.config()
  local telescope = require("telescope");
  local actions = require "telescope.actions";

  telescope.setup {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      path_display = { "absolute" },
      file_ignore_patterns = { ".git/" },
      mappings = {
        i = {
          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },
      layout_config = {
        width = function(_, max_columns, _)
          return max_columns
        end,
      }
    },
  }
end

return M
