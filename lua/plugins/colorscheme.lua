local themes = require("plugins.themes")
local theme_count = #themes

local state_file = vim.fn.stdpath("data") .. "/colorscheme_idx"

local function read_idx()
    local f = io.open(state_file, "r")
    if not f then return 1 end
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

local function inc_idx(idx)
    return (idx % theme_count) + 1
end

local function next_colorscheme()
    local idx = inc_idx(read_idx())
    write_idx(idx)
    vim.cmd.colorscheme(themes[idx].name)
    vim.notify("Theme: " .. themes[idx].name .. " [" .. idx .. "/" .. theme_count .. "]")
end

local function select_colorscheme()
    local current = read_idx()
    local items = {}
    for i = 1, theme_count do
        local marker = i == current and "● " or "  "
        items[i] = marker .. themes[i].name
    end

    vim.ui.select(items, { prompt = "Colorscheme" }, function(_, i)
        if not i then return end
        write_idx(i)
        vim.cmd.colorscheme(themes[i].name)
        vim.notify("Theme: " .. themes[i].name, vim.log.levels.INFO)
    end)
end

vim.keymap.set("n", "<leader>uP", next_colorscheme, { desc = "Next colorscheme" })
vim.keymap.set("n", "<leader>ut", select_colorscheme, { desc = "Select colorscheme" })

local idx = read_idx()
table.insert(themes, {
    "LazyVim/LazyVim",
    opts = { colorscheme = themes[idx].name },
})

return themes
