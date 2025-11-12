return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 500 })
            end,
            desc = "Format file or range",
        },
    },
    config = function()
        require("conform").formatters.rustfmt = {
            inherit = false,
            command = "rustfmt",
            args = { "+nightly", "$FILENAME" },
            stdin = false,
        }
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff_format", "ruff_organize_imports", lsp_format = "fallback" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                cmake = { "cmake_format" },
                sh = { "shfmt" },
                rust = { "rustfmt" },
                beancount = {"bean-check"},
            },
        })
    end,
}
