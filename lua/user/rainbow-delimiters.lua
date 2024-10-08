local M = {
  "hiphish/rainbow-delimiters.nvim",
  event = "BufRead",
}

function M.config()
  local rainbow_delimiters = require 'rainbow-delimiters'

  require("rainbow-delimiters.setup") {
  --   strategy = {
  --     [''] = rainbow_delimiters.strategy['global'],
  --     commonlisp = rainbow_delimiters.strategy['local'],
  --   },
  --   query = {
  --     [''] = 'rainbow-delimiters',
  --     latex = 'rainbow-blocks',
  --   },
    highlight = {
      'RainbowDelimiterYellow',
      'RainbowDelimiterBlue',
      'RainbowDelimiterOrange',
      'RainbowDelimiterGreen',
      'RainbowDelimiterViolet',
      'RainbowDelimiterCyan',
      'RainbowDelimiterRed',
    },
  }
end

return M
