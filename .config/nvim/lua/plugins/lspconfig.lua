local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig")

capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

-- LSP Server config
lspconfig.cssls.setup({
	capabilities = capabilities,
	settings = {
		scss = {
			lint = {
				idSelector = "warning",
				zeroUnits = "warning",
				duplicateProperties = "warning",
			},
			completion = {
				completePropertyWithSemicolon = true,
				triggerPropertyValueCompletion = true,
			},
		},
	},
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
	end,
})
lspconfig.tsserver.setup({
	capabilities = capabilities,
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
	end,
})

lspconfig.pyright.setup({})

lspconfig.html.setup({
	capabilities = capabilities,
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
	end,
})

lspconfig["lua_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "on_attach" },
			},
		},
	},
})
