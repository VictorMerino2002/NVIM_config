return {
    "zbirenbaum/copilot.lua",
    opts = {
        suggestion = {
            enabled = true,
            auto_trigger = true,
            keymap = {
                accept = false, -- desactiva el Tab
            },
            panel = { enabled = false },
        },
        filetypes = {
            ["*"] = true,
        },
    },
}
