return {
    {
        "olimorris/onedarkpro.nvim",
        config = function()
            require("onedarkpro").setup({
                colorscheme = "onedark",
            })
            vim.cmd("colorscheme onedark_dark")
        end,
    },
}
