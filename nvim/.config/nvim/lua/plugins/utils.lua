return {
    {
        "echasnovski/mini.icons",
        lazy = true,
        opts = {
            file = {
                [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
                ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
            },
            filetype = {
                dotenv = { glyph = "", hl = "MiniIconsYellow" },
            },
        },
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    {
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        },
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "xzbdmw/colorful-menu.nvim",
    },
    {
        "danymat/neogen",
        config = function()
            require("neogen").setup({ snippet_engine = "luasnip" })
            local opts = { noremap = true, silent = true, desc = "Generate Doc" }
            vim.api.nvim_set_keymap("n", "<Leader>cd", ":lua require('neogen').generate()<CR>", opts)
        end,
        -- Uncomment next line if you want to follow only stable versions
        -- version = "*"
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            completions = { blink = { enabled = true } },
            bullet = {
                -- Turn on / off list bullet rendering
                enabled = true,
            },
            checkbox = {
                -- Turn on / off checkbox state rendering
                enabled = true,
                -- Determines how icons fill the available space:
                --  inline:  underlying text is concealed resulting in a left aligned icon
                --  overlay: result is left padded with spaces to hide any additional text
                position = "inline",
                unchecked = {
                    -- Replaces '[ ]' of 'task_list_marker_unchecked'
                    icon = "   󰄱 ",
                    -- Highlight for the unchecked icon
                    highlight = "RenderMarkdownUnchecked",
                    -- Highlight for item associated with unchecked checkbox
                    scope_highlight = nil,
                },
                checked = {
                    -- Replaces '[x]' of 'task_list_marker_checked'
                    icon = "   󰱒 ",
                    -- Highlight for the checked icon
                    highlight = "RenderMarkdownChecked",
                    -- Highlight for item associated with checked checkbox
                    scope_highlight = nil,
                },
            },
            html = {
                -- Turn on / off all HTML rendering
                enabled = true,
                comment = {
                    -- Turn on / off HTML comment concealing
                    conceal = false,
                },
            },
            latex = {
                enabled = true,
                converter = { 'utftex' },
                highlight = 'RenderMarkdownMath',
                position = 'above',
            },
        },
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = { -- set to setup table
        },
    },
    {
        "maskudo/devdocs.nvim",
        lazy = false,
        dependencies = {
            "folke/snacks.nvim",
        },
        cmd = { "DevDocs" },
        keys = {
            {
                "<leader>ho",
                mode = "n",
                "<cmd>DevDocs get<cr>",
                desc = "Get Devdocs",
            },
            {
                "<leader>hi",
                mode = "n",
                "<cmd>DevDocs install<cr>",
                desc = "Install Devdocs",
            },
            {
                "<leader>hv",
                mode = "n",
                function()
                    local devdocs = require("devdocs")
                    local installedDocs = devdocs.GetInstalledDocs()
                    vim.ui.select(installedDocs, {}, function(selected)
                        if not selected then
                            return
                        end
                        local docDir = devdocs.GetDocDir(selected)
                        -- prettify the filename as you wish
                        Snacks.picker.files({ cwd = docDir })
                    end)
                end,
                desc = "Get Devdocs",
            },
            {
                "<leader>hd",
                mode = "n",
                "<cmd>DevDocs delete<cr>",
                desc = "Delete Devdoc",
            }
        },
        opts = {
            ensure_installed = {
                "go",
                "html",
                "cpp",
                -- "dom",
                "http",
                -- "css",
                -- "javascript",
                -- "rust",
                -- some docs such as lua require version number along with the language name
                -- check `DevDocs install` to view the actual names of the docs
                "lua~5.1",
                -- "openjdk~21"
            },
        },
    },
    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        config = function()
            -- Setup orgmode
            require('orgmode').setup({
                org_agenda_files = '~/orgfiles/**/*',
                org_default_notes_file = '~/orgfiles/refile.org',
            })

            -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
            -- add ~org~ to ignore_install
            -- require('nvim-treesitter.configs').setup({
            --   ensure_installed = 'all',
            --   ignore_install = { 'org' },
            -- })
        end,
    }
}
