#!/bin/bash

export DOTFILES_DIR="${DOTFILES_DIR:-$(cd "$(dirname "$0")" && pwd)}"

# Remove created folders
echo "Removing folders..."
rm -rf $HOME/.config/nvim/.undo/
rm -rf $HOME/.config/nvim/.backup/
rm -rf $HOME/.config/nvim/.swp/
rm -rf $HOME/.hammerspoon/

# Remove created symlinks
echo "Removing symlinks..."
unlink $HOME/.zshrc
unlink $HOME/.zshrc_aliases
unlink $HOME/.p10k.zsh

unlink $HOME/.config/git
unlink $HOME/.config/nvim/lua
unlink $HOME/.config/nvim/init.lua

unlink $HOME/.hammerspoon/init.lua
unlink $HOME/.hammerspoon/Spoons

unlink $HOME/.tmux.conf
unlink $HOME/.hushlogin

if [ -d "$DOTFILES_DIR/.config" ]; then
    echo "Removing .config symlinks..."
    shopt -s dotglob
    for item in "$DOTFILES_DIR/.config/"*; do
        name="$(basename "$item")"
        case "$name" in
            .|..|nvim|git|zellij) continue ;;
        esac
        if [ -L "$HOME/.config/$name" ]; then
            unlink "$HOME/.config/$name"
        fi
    done
    shopt -u dotglob
fi

# Uninstall shell tools installed via Homebrew
if command -v brew >/dev/null 2>&1; then
    echo "Uninstalling shell tools installed by setup..."
    brew uninstall --ignore-dependencies zsh-autosuggestions zsh-syntax-highlighting powerlevel10k direnv zoxide fzf asdf || true
fi

# Remove zellij symlink/config if present
if [ -e "$HOME/.config/zellij" ] || [ -L "$HOME/.config/zellij" ]; then
    echo "Removing zellij config at $HOME/.config/zellij"
    rm -rf "$HOME/.config/zellij" || true
fi

# Revert shell to the original shell
if [ "$SHELL" == "$(which zsh)" ]; then
    echo "Reverting shell to bash..."
    chsh -s "$(which bash)"
else
    echo "Current shell is not zsh. No need to revert."
fi

# Cleanup environment variables or settings
echo "Removing environment variables and settings..."
sed -i '' '/eval "\$\/opt\/homebrew\/bin\/brew shellenv"/d' $HOME/.zprofile

echo "Cleanup done!"
