return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        { "windwp/nvim-ts-autotag" },
    },
    uild = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "java", "bash", "lua", "javascript", "typescript", "json", "yaml", "query", "markdown", "markdown_inline" },
            highlight = { enable = true },
            indent = { enable = true }
        })
    end
}
