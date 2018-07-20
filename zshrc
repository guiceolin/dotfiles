# zmodload zsh/zprof
## START Zplug config
#zstyle :omz:plugins:ssh-agent identities id_rsa Github_pecigonzalo
#
## Check if zplug is installed
if [[ ! -f ~/.zplug/init.zsh ]]; then
  git clone https://github.com/b4b4r07/zplug ~/.zplug
  source ~/.zplug/init.zsh
else
  # Load ZPLUG
  source ~/.zplug/init.zsh
fi

# Misc
# zsh-syntax-highlighting must be loaded after executing compinit command and sourcing other plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-autosuggestions", defer:3

# Set Theme
# zplug "mafredri/zsh-async", from:github, defer:0  # Load this first
# zplug "pecigonzalo/pure-spaceship-zsh-theme", use:pure.zsh, from:github, as:theme
# zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
# zplug "denysdovhan/spaceship-zsh-theme", as:theme, defer:3
zplug "guiceolin/zsh-theme", use:theme.zsh, as:theme, defer:3

# And load
# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  printf "Install plugins? [y/N] "
  if read -q; then
    echo
    zplug install
  else
    echo
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load

## FINISH Zplug config

fpath=(/usr/local/share/zsh-completions $fpath)

#### Source plugins
for file in $HOME/dotfiles/plugins/**/*.plugin.zsh; do
  source $file
done

