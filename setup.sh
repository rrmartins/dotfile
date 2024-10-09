#!/bin/bash

# Define the env var to Dotfiles folder
# export DOTFILES_DIR="/Users/rrmartins/Documents/projects/dotfile"

# Create folders
echo "Creating folders..."
mkdir -p $HOME/.config/
mkdir -p $HOME/.hammerspoon/

mkdir -p $HOME/.config/nvim/
mkdir -p $HOME/.config/nvim/.undo/
mkdir -p $HOME/.config/nvim/.backup/
mkdir -p $HOME/.config/nvim/.swp/

echo "Creating symlinks..."
ln -sfn "$DOTFILES_DIR/zshrc" $HOME/.zshrc
ln -sfn "$DOTFILES_DIR/zshrc_aliases" $HOME/.zshrc_aliases
ln -sfn "$DOTFILES_DIR/p10k.zsh" $HOME/.p10k.zsh

ln -sfn "$DOTFILES_DIR/git" $HOME/.config/

ln -sfn "$DOTFILES_DIR/nvim/lua" $HOME/.config/nvim/
ln -sfn "$DOTFILES_DIR/nvim/init.lua" $HOME/.config/nvim/

ln -sfn "$DOTFILES_DIR/hammerspoon/init.lua" $HOME/.hammerspoon/
ln -sfn "$DOTFILES_DIR/hammerspoon/Spoons" $HOME/.hammerspoon/

ln -sFfn "$DOTFILES_DIR/tmuxconf" $HOME/.tmux.conf
ln -sfn "$DOTFILES_DIR/hushlogin" $HOME/.hushlogin

# Instalar Homebrew e executar o bundle
if ! command -v brew &> /dev/null; then
    echo "Homebrew didnt found. Installing..."
    echo "This process may take a while..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew found. Updating..."
    brew update
fi

if [ -f "$DOTFILES_DIR/Brewfile" ]; then
    echo "Installing packages..."
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    brew bundle
else
    echo "Brewfile not found in $DOTFILES_DIR. Skipping brew bundle step."
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh didnt found. Installing..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh already installed."
fi

# Define the shell default as zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Current shell: $SHELL"
    echo "Zsh path: $(which zsh)"
    echo "Setting zsh as default shell..."
    chsh -s "$(which zsh)"
else
    echo "Current shell is zsh."
fi

# Install and configure Tmux Plugin Manager (TPM)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "TPM not found. Installing..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    chmod +x ~/.tmux/plugins/tpm/tpm
    echo "TPM installed successfully."
else
    echo "TPM already installed."
fi

echo "Setup done!"