return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = "▏" },
    exclude = { filetypes =
      {
        "startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit",
        "packer", "vimwiki", "markdown", "json", "txt", "vista", "help",
        "todoist", "NvimTree", "peekaboo", "git", "TelescopePrompt", "undotree",
        "flutterToolsOutline", "" -- for all buffers without a file type
      },
    },
  }
}
