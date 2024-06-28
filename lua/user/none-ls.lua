local M = {
	"nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
}

function M.config()
	local null_ls = require("null-ls")

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	null_ls.setup({
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({
					group = augroup,
					buffer = bufnr,
				})
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
		sources = {
			formatting.stylua,
			formatting.prettier,

			formatting.clang_format,
			--go-nullLs-settigs---------------------
			formatting.gofumpt,
			formatting.golines,
			formatting.goimports,
			diagnostics.golangci_lint,
			------------------------
			formatting.prettier.with({
				extra_filetypes = { "toml" , "nix"},
				-- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
			}),
      -- require("none-ls.diagnostics.eslint_d"),
			null_ls.builtins.completion.spell,
		},
	})
end

return M
