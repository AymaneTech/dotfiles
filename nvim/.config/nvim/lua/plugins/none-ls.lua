-- Use conform.nvim instead of none-ls for better Nvim 0.11 compatibility
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				yaml = { "prettier" },
				html = { "prettier" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				java = { "google-java-format" },
				kotlin = { "ktfmt" },
				go = { "gofmt" },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
			},
		})

		vim.keymap.set(
			"n",
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			{ noremap = true, silent = true }
		)
	end,
}
