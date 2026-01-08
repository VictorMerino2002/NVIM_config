return {
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent_bg = true,
            italic_comment = true,
            colors = {
                bg = "NONE",
            },
        },
        config = function(_, opts)
            require("dracula").setup(opts)
            vim.cmd.colorscheme("dracula")
        end,
    },
}
