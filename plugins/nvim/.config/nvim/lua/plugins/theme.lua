return {
  {
    'sainnhe/gruvbox-material',
    config = function()

      vim.cmd [[
      set background=dark

      let g:gruvbox_material_disable_italic_comment = 1
      let g:gruvbox_material_palette = 'original'
      let g:gruvbox_material_background = 'hard'
      colorscheme gruvbox-material
      ]]
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          theme  = 'gruvbox-material',
        },
      }
    end
  }
}
