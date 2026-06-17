local themes = {
    {
        name = "dracula",
        "Mofiqul/dracula.nvim",
        opts = {
            transparent_bg = true,
            italic_comment = true,
            colors = { bg = "NONE" },
        },
    },
    {
        name = "onedark",
        "olimorris/onedarkpro.nvim",
        config = function()
            require("onedarkpro").setup({ colors = { bg = "#111318" } })
        end,
    },
    {
        name = "catppuccin",
        "catppuccin/nvim",
    },
    {
        name = "tokyonight",
        "folke/tokyonight.nvim",
        opts = { style = "night" },
    },
    {
        name = "gruvbox",
        "ellisonleao/gruvbox.nvim",
        opts = { contrast = "hard" },
    },
    {
        name = "kanagawa",
        "rebelot/kanagawa.nvim",
        opts = { theme = "wave" },
    },
    {
        name = "rose-pine",
        "rose-pine/neovim",
        opts = { variant = "moon" },
    },
    {
        name = "nord",
        "shaunsingh/nord.nvim",
        config = function()
            vim.g.nord_contrast = true
            vim.g.nord_borders = true
        end,
    },
    {
        name = "nightfox",
        "EdenEast/nightfox.nvim",
    },
    {
        name = "material",
        "marko-cerovac/material.nvim",
        config = function()
            vim.g.material_style = "oceanic"
        end,
    },
    {
        name = "github_dark_default",
        "projekt0n/github-nvim-theme",
        lazy = false,
        priority = 1000,
        config = function()
            require("github-theme").setup({})
        end,
    },
    {
        name = "cyberdream",
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
        },
    },
}

return themes
