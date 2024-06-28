return {

local lspconfig = require("lspconfig")
local on_attach = function(client, bufnr) end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.tsserver.setup({
				capabilities = capabilities,
        cmd = {"typescript-language-server"},
        filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
        autostart = true,
				  settings = {
					typescript = {
						inlayHints = {
							-- taken from https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
							includeInlayEnumMemberValueHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = true, -- false
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayVariableTypeHintsWhenTypeMatchesName = true, -- false
						},
					},
					javascript = {
						inlayHints = {
							includeInlayEnumMemberValueHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayVariableTypeHintsWhenTypeMatchesName = true,
						},
					},
				},
			})
}
