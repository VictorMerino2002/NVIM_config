local state_file = vim.fn.stdpath("data") .. "/colorscheme_idx"

local function read_idx()
    local f = io.open(state_file, "r")
    if not f then
        return 1
    end
    local val = tonumber(f:read("*a"))
    f:close()
    return val or 1
end

local function write_idx(idx)
    local f = io.open(state_file, "w")
    if f then
        f:write(tostring(idx))
        f:close()
    end
end
local themes = {
    {
        name = "dracula",
        "Mofiqul/dracula.nvim",
        lazy = true,
        opts = {
            transparent_bg = true,
            italic_comment = true,
            colors = { bg = "NONE" },
        },
    },
    {
        name = "onedark",
        "olimorris/onedarkpro.nvim",
        lazy = true,
        config = function()
            require("onedarkpro").setup({
                colors = { bg = "#111318" },
            })
        end,
    },
    {
        name = "catppuccin",
        "catppuccin/nvim",
        lazy = true,
    },
    {
        name = "tokyonight",
        "folke/tokyonight.nvim",
        lazy = true,
        opts = {
            style = "night", -- night | storm | day | moon
        },
    },
    {
        name = "gruvbox",
        "ellisonleao/gruvbox.nvim",
        lazy = true,
        opts = {
            contrast = "hard", -- hard | soft | ""
        },
    },
    {
        name = "kanagawa",
        "rebelot/kanagawa.nvim",
        lazy = true,
        opts = {
            theme = "wave", -- wave | dragon | lotus
        },
    },
    {
        name = "rose-pine",
        "rose-pine/neovim",
        lazy = true,
        opts = {
            variant = "moon", -- auto | main | moon | dawn
            styles = { transparency = true },
        },
    },
    {
        name = "nord",
        "shaunsingh/nord.nvim",
        lazy = true,
        config = function()
            vim.g.nord_contrast = true
            vim.g.nord_borders = true
        end,
    },
    {
        name = "nightfox",
        "EdenEast/nightfox.nvim",
        lazy = true,
        -- variantes: nightfox | dayfox | dawnfox | duskfox | nordfox | terafox | carbonfox
    },
    {
        name = "material",
        "marko-cerovac/material.nvim",
        lazy = true,
        config = function()
            vim.g.material_style = "oceanic" -- darker | lighter | oceanic | palenight | deep ocean
        end,
    },
    {
        "projekt0n/github-nvim-theme",
        name = "github_dark_default",
        lazy = false,
        priority = 1000,
        config = function()
            require("github-theme").setup({})
        end,
    },
}

local theme_count = #themes

local function open_selector()
    local current_idx = read_idx()
    local items = {}
    for i = 1, theme_count do
        local marker = i == current_idx and "●" or " "
        items[i] = marker .. " " .. themes[i].name
    end

    vim.ui.select(items, {
        prompt = "Colorscheme",
    }, function(_, i)
        if not i then
            return
        end
        write_idx(i)
        vim.cmd.colorscheme(themes[i].name)
        vim.notify("Theme: " .. themes[i].name, vim.log.levels.INFO)
    end)
end

vim.keymap.set("n", "<leader>uP", function()
    local idx = read_idx()
    idx = (idx % theme_count)
    write_idx(idx)
    vim.cmd.colorscheme(themes[idx].name)
    vim.notify("Theme: " .. themes[idx].name .. " [" .. idx .. "/" .. theme_count .. "]")
end, { desc = "Next colorscheme" })

vim.keymap.set("n", "<leader>ut", open_selector, { desc = "Select colorscheme" })

local idx = read_idx()
themes[#themes + 1] = {
    "LazyVim/LazyVim",
    opts = {
        colorscheme = themes[idx].name,
    },
}
return themes
