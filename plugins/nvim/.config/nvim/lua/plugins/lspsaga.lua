local ui = {
  border = { '🭽', '▔', '🭾', '▕', '🭿', '▁', '🭼', '▏' },
  winblend = 0,
  title = false,
  diagnostic = '  ',
}

local lightbulb = {
  enable = false,
}

local definition = {
  edit = '<C-e>',
  vsplit = '<C-v>',
  split = '<C-h>',
  quit = '<C-q>',
}

local winbar = {
  enable = false,
  folder_level = 1,
  show_file = true,
  separator = '  ',
}

local diagnostic = {
  max_show_width = 0.5,
  show_code_action = false,
  on_insert = false,
  show_source = false,
  border_follow = false,
  text_hl_follow = true,
  extend_relatedInformation = true,
}

local hover = {
  max_width = 0.5,
}

return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = function()

    require('lspsaga').setup {
      lightbulb = lightbulb,
      ui = ui,
      definition = definition,
      symbol_in_winbar = winbar,
      diagnostic = diagnostic,
      hover = hover,
    }

  end,
  dependencies = {
    {"nvim-tree/nvim-web-devicons"},
    --Please make sure you install markdown and markdown_inline parser
    {"nvim-treesitter/nvim-treesitter"}
  }
}
