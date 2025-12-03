require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "qmlls"}
vim.lsp.enable(servers)
