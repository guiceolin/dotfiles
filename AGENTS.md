# Dotfiles

## Plugin structure

```
plugins/<name>/
  <name>.plugin.zsh   # sourced automatically when plugin is enabled
  install.sh          # installs the dependency (optional)
```

Enabled plugins are symlinked into `~/.config/dotfiles/enabled/`.

## Commands

`dotfiles` is a zsh function (not a script). Run it in the shell:

```sh
dotfiles list              # list installed and available plugins
dotfiles enable <name>     # enable plugin: symlink + run install.sh + source it
dotfiles remote <git-url>  # clone external plugin into .remote_plugins/
dotfiles remote --list     # list remote plugins
```

## Creating a plugin

1. Create `plugins/<name>/<name>.plugin.zsh`
2. Optionally add `plugins/<name>/install.sh`
3. Run `dotfiles enable <name>`

For slow-loading tools, use lazy load:

```zsh
lazy_load 'cmd1' 'cmd2' <<- 'EOF'
  # init code
EOF
```

## Commits

Use [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>[optional scope]: <description>
```

Common types: `feat`, `fix`, `docs`, `refactor`, `chore`, `ci`, `build`.

- Present tense, imperative mood: "add" not "added"
- Description under 72 characters
- One logical change per commit

Stage specific files — never commit secrets (`.env`, credentials).

Breaking changes: append `!` after type (`feat!:`) or add `BREAKING CHANGE:` footer.
