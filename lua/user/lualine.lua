local M = {
  "nvim-lualine/lualine.nvim",
  event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  local location = {
    "location",
    padding = 0,
  }

  local spaces = function()
    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end

  local custom_theme = function()
    local colors = {
      gray     = '#767676',
      lightred = '#D16969',
      blue     = '#3B71C2',
      pink     = '#AE48B6',
      black    = '#000000',
      white    = '#E5E5E5',
      green    = '#56B97F',
    }

    return {
      normal = {
        b = { fg = colors.green, bg = colors.black },
        a = { fg = colors.black, bg = colors.green, gui = 'bold' },
        c = { fg = colors.white, bg = colors.black },
      },
      visual = {
        b = { fg = colors.pink, bg = colors.black },
        a = { fg = colors.black, bg = colors.pink, gui = 'bold' },
      },
      inactive = {
        b = { fg = colors.black, bg = colors.blue },
        a = { fg = colors.white, bg = colors.gray, gui = 'bold' },
      },
      replace = {
        b = { fg = colors.lightred, bg = colors.black },
        a = { fg = colors.black, bg = colors.lightred, gui = 'bold' },
        c = { fg = colors.white, bg = colors.black },
      },
      insert = {
        b = { fg = colors.blue, bg = colors.black },
        a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
        c = { fg = colors.white, bg = colors.black },
      },
    }
  end

  lualine.setup {
    options = {
      globalstatus = true,
      icons_enabled = true,
      theme = custom_theme,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "alpha", "dashboard", "Nvim-Tree" , "neo-tree" },
      ignore_focus = { "Nvim-Tree" , "neo-tree"},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {'filename'},
      lualine_x = { spaces, "encoding", "filetype" },
      lualine_y = { location },
      lualine_z = { "progress" },
    },
    extensions = { "nvim-tree", "neo-tree" },
  }
end

return M
