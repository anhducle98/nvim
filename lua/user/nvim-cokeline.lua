local M = {
  "willothy/nvim-cokeline",
  -- event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
  dependencies = {
    "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
    "nvim-tree/nvim-web-devicons", -- If you want devicons
    "stevearc/resession.nvim"       -- Optional, for persistent history
  },
}

function M.config()
  local get_hex = require('cokeline.hlgroups').get_hl_attr

  require('cokeline').setup({
    default_hl = {
      fg = function(buffer)
        return buffer.is_focused
        and '#000000'
        or '#E5E5E5'
      end,
      bg = function(buffer)
        return
        buffer.is_focused
        and '#E5E5E5'
        or '#000000'
      end,
    },

    sidebar = {
      filetype = {'NvimTree', 'neo-tree'},
      components = {
        {
          text = function(buf)
            return 'File Explorer'
          end,
          fg = '#E5E54D',
          bg = '#000000',
          bold = true,
        },
      }
    },
  }) 
end

return M
