return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    -- Core languages
                    "lua_ls",
                    "bashls",
                    "jsonls",

                    -- Web development
                    "ts_ls",
                    "angularls",
                    "html",
                    "tailwindcss",

                    -- Java ecosystem
                    "jdtls",
                    "kotlin_language_server",

                    -- Systems languages
                    "clangd",
                    "gopls",

                    -- Other languages
                    "ast_grep",
                    "intelephense",
                    "yamlls",
                    "dockerls",
                    "docker_compose_language_service",
                    "grammarly",
                    "sqlls",
                },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")

            -- Configure diagnostic signs
            local signs = {
                Error = "✘",
                Warn = "▲",
                Hint = "⚡",
                Info = "●",
            }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            -- Configure diagnostic display
            vim.diagnostic.config({
                underline = true,
                virtual_text = {
                    prefix = "●",
                    format = function(diagnostic)
                        if diagnostic.severity == vim.diagnostic.severity.ERROR then
                            return "✘ " .. diagnostic.message
                        elseif diagnostic.severity == vim.diagnostic.severity.WARN then
                            return "▲ " .. diagnostic.message
                        elseif diagnostic.severity == vim.diagnostic.severity.HINT then
                            return "⚡ " .. diagnostic.message
                        else
                            return "● " .. diagnostic.message
                        end
                    end,
                },
                severity_sort = true,
            })

            -- Language-specific configurations
            local servers = {
                -- Lua
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim" } },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                            },
                            telemetry = { enable = false },
                        },
                    },
                },

                -- Simple configs
                bashls = {},
                jsonls = {},
                html = {},
                angularls = {},
                tailwindcss = {},

                -- TypeScript/JavaScript with enhanced settings
                ts_ls = {
                    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
                    settings = {
                        typescript = {
                            tsserver = {
                                maxTsServerMemory = 4096,
                            },
                            inlayHints = {
                                includeInlayParameterNameHints = "all",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayVariableTypeHints = true,
                                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                            },
                        },
                        javascript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "all",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = true,
                            },
                        },
                    },
                },

                -- Go with comprehensive settings
                gopls = {
                    settings = {
                        gopls = {
                            analyses = {
                                unusedparams = true,
                                unreachable = true,
                                undeclaredname = true,
                                unusedwrite = true,
                                useany = true,
                            },
                            codelenses = {
                                gc_details = false,
                                generate = true,
                                regenerate_cgo = true,
                                run_govulncheck = true,
                                test = true,
                                tidy = true,
                                upgrade_dependency = true,
                                vendor = true,
                            },
                            completeUnimported = true,
                            deepCompletion = true,
                            usePlaceholders = true,
                            staticcheck = true,
                            hints = {
                                assignVariableTypes = true,
                                compositeLiteralFields = true,
                                compositeLiteralTypes = true,
                                constantValues = true,
                                functionTypeParameters = true,
                                parameterNames = true,
                                rangeVariableTypes = true,
                            },
                        },
                    },
                    filetypes = { "go", "gomod", "gowork", "gotmpl" },
                },

                -- C/C++ with Clangd enhancements
                clangd = {
                    cmd = {
                        "clangd",
                        "--offset-encoding=utf-16",
                        "--header-insertion=iwyu",
                        "--completion-style=detailed",
                        "--function-arg-placeholders=true",
                        "--clang-tidy",
                        "--clang-tidy-checks=*,-misc-const-correctness,-readability-implicit-bool-conversion",
                        "--background-index",
                        "--pch-storage=memory",
                    },
                    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
                    settings = {
                        clangd = {
                            InlayHints = {
                                Enabled = true,
                                ParameterHints = true,
                                TypeHints = true,
                                ChainingHints = true,
                            },
                        },
                    },
                },

                -- Java with JDTLS
                jdtls = {
                    settings = {
                        java = {
                            format = {
                                enabled = true,
                                settings = {
                                    url = "",
                                    profile = "GoogleStyle",
                                },
                            },
                            signatureHelp = { enabled = true },
                            contentProvider = { preferred = "fernflower" },
                            sources = {
                                organizeImports = {
                                    starThreshold = 9999,
                                    staticStarThreshold = 9999,
                                },
                            },
                            codeGeneration = {
                                hashCodeEquals = {
                                    useJava7Objects = true,
                                },
                                useBlocks = true,
                            },
                            configuration = {
                                runtimes = {
                                    {
                                        name = "JavaSE-11",
                                        path = os.getenv("JAVA_HOME") or "/usr/lib/jvm/java-11-openjdk",
                                        default = true,
                                    },
                                    {
                                        name = "JavaSE-17",
                                        path = "/usr/lib/jvm/java-17-openjdk",
                                    },
                                },
                            },
                        },
                    },
                },

                -- Kotlin Language Server
                kotlin_language_server = {
                    settings = {
                        kotlin = {
                            traces = {
                                server = "verbose",
                            },
                        },
                    },
                },

                -- YAML with schema support
                yamlls = {
                    settings = {
                        yaml = {
                            schemas = {
                                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                                ["https://json.schemastore.org/docker-compose.json"] = "docker-compose*.yml",
                            },
                        },
                    },
                },
            }

            mason_lspconfig.setup_handlers({
                function(server_name)
                    local server_config = servers[server_name] or {}
                    server_config.capabilities = capabilities
                    lspconfig[server_name].setup(server_config)
                end,
            })

            -- LSP Keybindings
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true })
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true, silent = true })
            vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>dh", vim.lsp.buf.signature_help, { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
                { noremap = true, silent = true })
        end,
    },
}
