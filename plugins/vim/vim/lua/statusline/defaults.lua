local M = {}

M.delimiters = {
    left = '',
    right = '',
}

M.modes = {
  colors = {
    background = 'black',
    foreground = 'white',
    normal = 'green',
    insert = 'blue',
    visual = 'purple',
    visualblock = 'purple',
    command = 'red',
    terminal = 'blue',
    replace = 'yellow',
    default = 'white'
  },
  icons = {
    normal = 'NORMAL',
    insert = 'INSERT',
    visual = 'VISUAL',
    visualblock = 'VISUAL-B',
    command = 'COMMAND',
    terminal = 'TERMINAL',
    replace = 'REPLACE',
    default = 'UNKOWN',
  }
}

M.palette = {
  background = "Black",
  foreground = "White",
  colors = {
    black = "Black",
    red = "#af0000",
    green = "Green",
    yellow = "Yellow",
    blue = "Blue",
    purple = "DarkMagenta",
    cyan = "Cyan",
    white = "White",
    lightgrey = "LightGrey",
    darkgrey = "#303030",
  }
}

return M
