return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
        { "<leader>o", "<cmd>Neotree focus<cr>", desc = "Focus file explorer" },
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "rounded",
            filesystem = {
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,
                filtered_items = {
                    visible = false,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        ".git",
                        "__pycache__",
                        ".pytest_cache",
                        "node_modules",
                        ".venv",
                    },
                },
            },
            window = {
                width = 35,
                mappings = {
                    ["<space>"] = "none",
                },
            },
        })
    end,
}

