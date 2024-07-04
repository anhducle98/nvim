local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
    },
    {
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    {
      "hrsh7th/cmp-buffer",
    },
    {
      "hrsh7th/cmp-path",
    },
    {
      "hrsh7th/cmp-cmdline",
    },
    {
      "hrsh7th/cmp-nvim-lua",
    },
    { "hrsh7th/cmp-vsnip", },
    { "hrsh7th/vim-vsnip", },
  },
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
}

function M.config()
  local cmp = require "cmp"

  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  -- local kind_icons = {
  --   Text = "",
  --   Method = "",
  --   Function = "",
  --   Constructor = "",
  --   Field = "",
  --   Variable = "",
  --   Class = "",
  --   Interface = "",
  --   Module = "",
  --   Property = "",
  --   Unit = "",
  --   Value = "",
  --   Enum = "",
  --   Keyword = "",
  --   Snippet = "",
  --   Color = "",
  --   File = "",
  --   Reference = "",
  --   Folder = "",
  --   EnumMember = "",
  --   Constant = "",
  --   Struct = "",
  --   Event = "",
  --   Operator = "",
  --   TypeParameter = "",
  -- }

  cmp.setup {
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },

    mapping = cmp.mapping.preset.insert {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm { select = false },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
          -- elseif luasnip.expandable() then
          --   luasnip.expand()
          -- elseif luasnip.expand_or_jumpable() then
          --   luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end, {
          "i",
          "s",
        }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, {
          "i",
          "s",
        }),
    },
    -- formatting = {
    --   fields = { "kind", "abbr", "menu" },
    --   format = function(entry, vim_item)
    --     vim_item.kind = kind_icons[vim_item.kind]
    --     vim_item.menu = ({
    --       nvim_lsp = "",
    --       buffer = "",
    --       path = "",
    --       emoji = "",
    --     })[entry.source.name]
    --     return vim_item
    --   end,
    -- },
    sources = {
      { name = "nvim_lsp" },
      { name = 'nvim_lsp_signature_help' },
      { name = "vsnip" },
      { name = "buffer" },
      { name = "path" },
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    experimental = {
      ghost_text = true,
    },
  }
end

return M
