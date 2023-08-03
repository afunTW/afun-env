require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
        "gopls",
        "clangd",
        "marksman",
    },
    automatic_installation = true
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local navic = require("nvim-navic")
local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end
local util = require("lspconfig/util")
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            runtime = {
                version = "LuaJIT"}
            ,
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim", "require"},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
    capabilities = capabilities,
    on_attach = on_attach,
})
lspconfig.pyright.setup({
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = {"python"},
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    },
    capabilities = capabilities,
    on_attach = on_attach,
})
lspconfig.gopls.setup({
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
    capabilities = capabilities,
    on_attach = on_attach,
})
lspconfig.clangd.setup({
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_dir = util.root_pattern(
      '.clangd',
      '.clang-tidy',
      '.clang-format',
      'compile_commands.json',
      'compile_flags.txt',
      'configure.ac',
      '.git'
    ),
    capabilities = capabilities,
    on_attach = on_attach,
})
lspconfig.marksman.setup({
    cmd = { "marksman", "server" },
    filetypes = { "markdown" },
    capabilities = capabilities,
    on_attach = on_attach,
})
