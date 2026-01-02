return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "python",
                    "typescript",
                    "tsx",
                    "javascript",
                    "html",
                    "css",
                    "json",
                    "yaml",
                    "lua",
                    "bash",
                    "markdown",
                },
            })
        end,
    },
}

