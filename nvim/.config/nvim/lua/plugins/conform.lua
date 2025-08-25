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
            go = { 'gofmt' },
            yaml = { 'yamlfmt' },
            -- python = { 'ruff' },
            javascript = { 'prettierd', stop_after_first = true },
            javascriptreact = { 'prettierd', stop_after_first = true },
            typescript = { 'prettierd', stop_after_first = true },
            typescriptreact = { 'prettierd', stop_after_first = true },
        },
    },
}
