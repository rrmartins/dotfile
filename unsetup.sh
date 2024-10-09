#!/bin/bash

# Remove created folders
echo "Removing folders..."
rm -rf $HOME/.config/nvim/.undo/
rm -rf $HOME/.config/nvim/.backup/
rm -rf $HOME/.config/nvim/.swp/
rm -rf $HOME/.config/nvim/
rm -rf $HOME/.config/
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