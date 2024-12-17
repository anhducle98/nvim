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
      },
      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require('telescope').load_extension('fzf')
    },
  }
end

return M
