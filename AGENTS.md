# Dotfiles

## Plugin structure

```
plugins/<name>/
  <name>.env.zsh      # PATH and env exports for all shells (optional)
  <name>.plugin.zsh   # interactive shell setup: eval, aliases, completions (optional)
  install.sh          # installs the dependency (optional)
```

Enabled plugins are symlinked into `~/.config/dotfiles/enabled/`.

`NAME.env.zsh` — loaded by `.zshenv` for every shell (Claude Code, scripts, cron, terminal).
Rules: only `export` and `path=(...)`. No `eval`, no subprocesses.

`NAME.plugin.zsh` — loaded by `.zshrc` for interactive shells only.
Use for `eval "$(tool init -)"`, aliases, completions, and hooks.

Create `NAME.env.zsh` only when the plugin adds binaries to `PATH`.

## Commands

`dotfiles` is a zsh function (not a script). Run it in the shell:

```sh
dotfiles list              # list installed and available plugins
dotfiles enable <name>     # enable plugin: symlink + run install.sh + source it
dotfiles remote <git-url>  # clone external plugin into .remote_plugins/
dotfiles remote --list     # list remote plugins
```

## Creating a plugin

1. Create `plugins/<name>/<name>.plugin.zsh` (interactive setup)
2. Optionally create `plugins/<name>/<name>.env.zsh` (if the plugin needs `PATH` additions)
3. Optionally add `plugins/<name>/install.sh`
4. Run `dotfiles enable <name>`

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
