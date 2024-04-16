local M = {
    "gmr458/vscode_modern_theme.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("vscode_modern").setup({
            cursorline = true,
            -- transparent_background = true,
            transparent_background = false,
            custom_dark_background = '#000000',
            nvim_tree_darker = true,
        })
        vim.cmd.colorscheme("vscode_modern")
    end,
}

-- local M = {
--   "anhducle98/fleet-theme-nvim",
--   lazy = false,
--   priority = 1000,
--   config = function() vim.cmd("colorscheme fleet") end
-- }

return M

-- local M = {
--   "rebelot/kanagawa.nvim",
--   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
-- }
--
-- M.name = "kanagawa"
--
-- function M.config()
--   require("kanagawa").setup {
--     compile = false,             -- enable compiling the colorscheme
--     undercurl = true,            -- enable undercurls
--     commentStyle = { italic = false },
--     functionStyle = {},
--     keywordStyle = { italic = false },
--     statementStyle = { bold = true },
--     typeStyle = { italic = false },
--     -- transparent = true,         -- do not set background color
--     dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
--     terminalColors = true,       -- define vim.g.terminal_color_{0,17}
--     overrides = function(colors) -- add/modify highlights
--       local theme = colors.theme
--       return {
--         NormalFloat = { bg = "none" },
--         FloatBorder = { bg = "none" },
--         FloatTitle = { bg = "none" },
--
--         -- Save an hlgroup with dark background and dimmed foreground
--         -- so that you can use it where your still want darker windows.
--         -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
--         NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
--
--         -- Popular plugins that open floats will link to NormalFloat by default;
--         -- set their background accordingly if you wish to keep them dark and borderless
--         LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
--         MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
--
--         TelescopeTitle = { fg = theme.ui.special, bold = true },
--         TelescopePromptNormal = { bg = theme.ui.bg_p1 },
--         TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
--         TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
--         TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
--         TelescopePreviewNormal = { bg = theme.ui.bg_dim },
--         TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
--
--         Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
--         PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
--         PmenuSbar = { bg = theme.ui.bg_m1 },
--         PmenuThumb = { bg = theme.ui.bg_p2 },
--       }
--     end,
--     theme = "wave",
--     background = {
--       dark = "wave",
--       light = "lotus"
--     },
--   }
--
--   local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
--   if not status_ok then
--     return
--   end
-- end
--
-- return M
