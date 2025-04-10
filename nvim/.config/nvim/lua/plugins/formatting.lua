return {
    'stevearc/conform.nvim',
    keys = {
        {
            -- Customize or remove this keymap to your liking
            '<leader>lf',
            function()
                require('conform').format { async = true }
            end,
            mode = '',
            desc = 'Format buffer',
        },
    },
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'ruff' },
            javascript = { 'prettierd', stop_after_first = true },
        },
    },
    -- config = function()
    --     local opts = { noremap = true, silent = true }
    --     local keymap = vim.api.nvim_set_keymap
    --
    --     require('conform').setup {
    --         formatters_by_ft = {
    --             lua = { 'stylua' },
    --             -- Conform will run multiple formatters sequentially
    --             -- python = { "isort", "black" },
    --             -- You can customize some of the format options for the filetype (:help conform.format)
    --             -- rust = { "rustfmt", lsp_format = "fallback" },
    --             -- Conform will run the first available formatter
    --             -- javascript = { "prettierd", "prettier", stop_after_first = true },
    --         },
    --     }
    --     keymap('n', '<leader>lf', ":lua require('conform').format{ async = true, lsp_format = 'fallback' }<CR>", opts)
    -- end,
}
