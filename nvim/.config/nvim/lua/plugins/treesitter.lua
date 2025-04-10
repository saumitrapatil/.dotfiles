return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
        ensure_installed = {
            'lua',
            'python',
            'javascript',
            'typescript',
            'vimdoc',
            'vim',
            'regex',
            'terraform',
            'sql',
            'dockerfile',
            'toml',
            'json',
            'java',
            'go',
            'gitignore',
            'yaml',
            'make',
            'cmake',
            'markdown',
            'markdown_inline',
            'bash',
            'tsx',
            'css',
            'html',
        },
        auto_install = true,
        highlight = {
            enable = true,
            -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
            --  If you are experiencing weird indenting issues, add the language to
            --  the list of additional_vim_regex_highlighting and disabled languages for indent.
            additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby' } },
    },
}
