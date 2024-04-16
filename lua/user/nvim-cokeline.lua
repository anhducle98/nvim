local M = {
  "willothy/nvim-cokeline",
  event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
  dependencies = {
    "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
    "nvim-tree/nvim-web-devicons", -- If you want devicons
    "stevearc/resession.nvim"       -- Optional, for persistent history
  },
}

function M.config()
  local get_hex = require('cokeline.hlgroups').get_hl_attr
  local yellow = vim.g.terminal_color_3

  require('cokeline').setup({
    default_hl = {
      fg = function(buffer)
        return
        buffer.is_focused
        and get_hex('ColorColumn', 'bg')
        or get_hex('Normal', 'fg')
      end,
      bg = function(buffer)
        return
        buffer.is_focused
        and get_hex('Normal', 'fg')
        or get_hex('ColorColumn', 'bg')
      end,
    },

    sidebar = {
      filetype = {'NvimTree', 'neo-tree'},
      components = {
        {
          text = function(buf)
            return buf.filetype
          end,
          fg = yellow,
          bg = function() return get_hex('NvimTreeNormal', 'bg') end,
          bold = true,
        },
      }
    },
  }) 
end

return M
