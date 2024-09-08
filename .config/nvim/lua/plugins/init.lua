return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
    	"nvim-treesitter/nvim-treesitter",
    	opts = {
    		ensure_installed = {
    			"vim", "lua", "vimdoc",
                "html", "css",
                "python", "go"
    		},
    	},
    },

    {
        "eandrju/cellular-automaton.nvim",
        lazy = false,
        config = function()
            vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
        end,
    },
    {
        "ThePrimeagen/harpoon",
        lazy = false,
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
            vim.keymap.set("n", "<A-1>", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<A-2>", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<A-3>", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<A-4>", function() ui.nav_file(4) end)
        end,
    },
    {
        "mbbill/undotree",
        lazy = false,
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end,
    },
    {
        "tpope/vim-fugitive",
        lazy = false,
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end,
    },

    {
        "christoomey/vim-tmux-navigator",
        lazy = false
    }
}
