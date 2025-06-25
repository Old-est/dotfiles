--- @type vim.lsp.Config
return {
    cmd = { "clangd",  "--header-insertion=never",
        "--fallback-style=llvm",
        "--experimental-modules-support"},
    filetypes = { "cpp", "h", "hpp", "cc", "c", "cppm" },
    root_markers = { '.git', ".clangd", "compile-commands.json" },
}
