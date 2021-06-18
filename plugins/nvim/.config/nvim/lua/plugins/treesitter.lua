require'nvim-treesitter.configs'.setup {
    ensure_installed = { "java", "javascript", "python", "lua" },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
}
