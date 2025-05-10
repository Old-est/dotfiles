return {
    { -- Collection of various small independent plugins/modules
        "echasnovski/mini.nvim",
        config = function()
            require("mini.ai").setup()
            require("mini.move").setup()
            require("mini.surround").setup()
            require("mini.pairs").setup()
            require("mini.bracketed").setup()
        end,
    },
}
