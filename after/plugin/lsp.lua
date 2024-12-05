local lsp = require('lsp-zero')

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local lsp_format_on_save = function(bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
            if vim.bo.filetype ~= 'proto' then vim.lsp.buf.format() end
        end,
    })
end

lsp.preset("recommended")

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {
        'eslint',
        'lua_ls',
        'rust_analyzer',
        'ruby_lsp',
        'clangd'
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
})

local cmp = require('cmp')

local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
})


lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })

    lsp_format_on_save(bufnr)

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>cs", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>cd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>cn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
end)

lsp.setup()
