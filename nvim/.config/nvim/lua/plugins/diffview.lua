return {
    'sindrets/diffview.nvim',
    config = function()
        require('diffview').setup()
        vim.keymap.set('n', '<leader>dv', ':DiffviewOpen<CR>')
        vim.keymap.set('n', '<leader>dC', ':DiffviewClose<CR>')
        vim.keymap.set('n', '<leader>dt', ':DiffviewToggleFiles<CR>')
        vim.keymap.set('n', '<leader>df', ':DiffviewFileHistory %<CR>')
    end,
}
