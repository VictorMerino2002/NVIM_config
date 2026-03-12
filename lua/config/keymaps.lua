-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true })

vim.keymap.set("n", "<leader>W", function()
    vim.opt.wrap = not vim.opt.wrap:get()
end, { desc = "Toggle wrap" })

vim.keymap.set("i", "<C-CR>", function()
    if require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
    end
end, { desc = "Accept Copilot suggestion" })
