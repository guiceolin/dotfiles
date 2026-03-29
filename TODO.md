# TODO

- [ ] Standardize output messages across plugin install scripts (format, colors, verbosity)
- [ ] Add verbose flag to `dotfiles enable` command
- [ ] Add installation mode option: OS package manager (dnf/brew/pacman) vs source/manual install (current behavior)
- [ ] Add pre-enable hook support (`<plugin>.enable.zsh`) to validate hard requirements before enabling a plugin
- [ ] Add disable hook support (`<plugin>.disable.zsh`) to clean up side effects on plugin disable (e.g. delta removing git include.path)
