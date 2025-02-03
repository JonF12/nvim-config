local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")

lspconfig.cssls.setup({
	on_attach = nvlsp.on_attach,
	on_init = nvlsp.on_init,
	capabilities = nvlsp.capabilities,
})

lspconfig.tailwindcss.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
	filetypes = {
		"templ",
		"javascript",
		"typescript",
		"react",
		"html",
		"css",
		"scss",
		"javascriptreact",
		"typescriptreact",
		"vue",
		"svelte",
	},
	init_options = {
		userLanguages = {
			templ = "html",
		},
	},
	root_dir = lspconfig.util.root_pattern("tailwind.config.js", "postcss.config.js"),
})

lspconfig.html.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
	filetypes = { "html", "templ", "cshtml" },
})
lspconfig.emmet_ls.setup({
	capabilities = nvlsp.capabilities,
	filetypes = { "html", "css", "templ" },
	init_options = {
		html = {
			options = {
				["bem.enabled"] = true,
			},
		},
	},
})
-- Custom server configurations
-- TypeScript/JavaScript with additional settings
lspconfig.ts_ls.setup({
	on_attach = nvlsp.on_attach,
	on_init = nvlsp.on_init,
	root_dir = lspconfig.util.root_pattern("package.json"),
	single_file_support = false,
	capabilities = nvlsp.capabilities,
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
	},
})

lspconfig.denols.setup({
	on_attach = nvlsp.on_attach,
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})

-- lspconfig.htmx.setup({})
