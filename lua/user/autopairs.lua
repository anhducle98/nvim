local M = {
  "windwp/nvim-autopairs",
  commit = "0e065d423f9cf649e1d92443c939a4b5073b6768",
  event = "InsertEnter",
  dependencies = {
    {
      "hrsh7th/nvim-cmp",
      commit = "cfafe0a1ca8933f7b7968a287d39904156f2c57d",
      event = {
        "InsertEnter",
        "CmdlineEnter",
      },
    },
  },
}

function M.config()
  require("nvim-autopairs").setup {
    check_ts = true, -- treesitter integration
    disable_filetype = { "TelescopePrompt" },
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },

    fast_wrap = {},
    ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
    enable_check_bracket_line = true,
  }

  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  local cmp = require "cmp"

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})
end

return M
