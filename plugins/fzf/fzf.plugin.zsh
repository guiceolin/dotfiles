# vim: set ft=zsh

if ! command -v fzf &> /dev/null
then
    echo "fzf is not installed. Please install it and try again."
    exit 1
fi

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
