# Guiceolin's Dotfiles

My very own dotfiles repository! Whoa!

## Usage:

    git clone git://github.com/guiceolin/dotfiles.git && cd dotfiles && ./install.sh 
  
**NOTE**

Remember to CHANGE git configs as this script sets them up with my personal configs (name, username and email)
    
## Plugins

Plugins live in `plugins/<name>/` and follow these conventions:

- One entry point per plugin: `<name>.plugin.zsh` — sourced automatically on shell start
- Optional `install.sh` — runs when the plugin is enabled via `dotfiles enable <name>`
- Plugins are activated by symlinking to `~/.config/dotfiles/enabled/`

To enable a plugin:

    dotfiles enable <name>

To list available and enabled plugins:

    dotfiles list

## Contribute

Found a bug? Have any suggestions?

- Fork-me
- Do amazing stuff
- ???
- Pull request


