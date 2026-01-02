return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason.nvim",
            "mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")

            -- Клавиши при подключении LSP
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
                    end

                    map("gd", vim.lsp.buf.definition, "Go to definition")
                    map("gr", vim.lsp.buf.references, "Go to references")
                    map("gi", vim.lsp.buf.implementation, "Go to implementation")
                    map("K", vim.lsp.buf.hover, "Hover documentation")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
                    map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
                    map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
                    map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
                    map("]d", vim.diagnostic.goto_next, "Next diagnostic")
                    map("<leader>d", vim.diagnostic.open_float, "Show diagnostic")
                end,
            })

            -- Настройки диагностики
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                float = { border = "rounded" },
            })
        end,
    },

    -- Установщик LSP серверов
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = function()
            require("mason").setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },

    -- Связь mason и lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            local lspconfig = require("lspconfig")
            
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",
                    "ts_ls",
                },
                automatic_installation = true,
                handlers = {
                    -- Обработчик по умолчанию
                    function(server_name)
                        lspconfig[server_name].setup({})
                    end,

                    -- Настройки для Python
                    ["pyright"] = function()
                        lspconfig.pyright.setup({
                            settings = {
                                python = {
                                    analysis = {
                                        typeCheckingMode = "basic",
                                        autoSearchPaths = true,
                                        useLibraryCodeForTypes = true,
                                    },
                                },
                            },
                        })
                    end,

                    -- Настройки для TypeScript
                    ["ts_ls"] = function()
                        lspconfig.ts_ls.setup({
                            settings = {
                                completions = {
                                    completeFunctionCalls = true,
                                },
                            },
                        })
                    end,
                },
            })
        end,
    },
}

