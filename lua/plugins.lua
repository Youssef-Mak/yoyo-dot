return {
    "folke/neodev.nvim",
    "folke/which-key.nvim",
    { "folke/neoconf.nvim",   cmd = "Neoconf" },

    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    { 'nvim-lua/plenary.nvim' },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "rust", "ruby" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },

    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { 'navarasu/onedark.nvim' },
    { 'vim-airline/vim-airline' },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
    { 'airblade/vim-gitgutter' },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    { 'github/copilot.vim' },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "olimorris/neotest-rspec",
            "rouge8/neotest-rust",
            "zidhuss/neotest-minitest",
        }
    },
    { 'ruanyl/vim-gh-line' },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        keys = {
            {
                "<leader>tt",
                function()
                    require("neotest").run.run()
                end,
                desc = "Run closest test",
            },
            {
                "<leader>tf",
                function()
                    require("neotest").run.run(vim.fn.expand("%"))
                end,
                desc = "Run file",
            },
        },
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("neotest").setup({
                adapters = {
                    require("neotest-rspec"),
                    require("neotest-rust"),
                    require("neotest-minitest"),
                },
            })
        end,

    },
}
