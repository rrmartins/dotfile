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

# Adicionando a instalação do YADR
echo "Installing YADR..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh)"

# Instalar Homebrew e executar o bundle
if ! command -v brew &>/dev/null; then
  echo "Homebrew didnt found. Installing..."
  echo "This process may take a while..."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [ -f "/opt/homebrew/bin/brew" ]; then
    BREW_BIN="/opt/homebrew/bin/brew"
  else
    BREW_BIN="/usr/local/bin/brew"
  fi

  echo "eval \"\$($BREW_BIN shellenv)\"" >>$HOME/.zprofile
  eval "$($BREW_BIN shellenv)"
  echo "export PATH=$(dirname $BREW_BIN):$PATH" >>~/.zshrc
else
  echo "Homebrew found. Updating..."
  brew update
fi

if [ -f "$DOTFILES_DIR/Brewfile" ]; then
  echo "Installing packages..."
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew bundle
else
  echo "Brewfile not found in $DOTFILES_DIR. Skipping brew bundle step."
fi

# Install common shell tools via Homebrew (zsh plugins, powerlevel10k, direnv, zoxide, fzf, asdf)
if command -v brew >/dev/null 2>&1; then
  echo "Installing shell tools via brew..."
  brew install zsh-autosuggestions zsh-syntax-highlighting powerlevel10k direnv zoxide fzf asdf || true
  if [ -d "$(brew --prefix)/opt/fzf" ]; then
    "$(brew --prefix)/opt/fzf/install" --key-bindings --completion --no-update-rc || true
  fi
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

# Install and configure Zellij
if ! command -v zellij &>/dev/null; then
  echo "Zellij not found. Installing..."
  brew install zellij
else
  echo "Zellij already installed."
fi

# Create Zellij configuration folder
echo "Creating Zellij configuration folder..."
mkdir -p $HOME/.config/zellij

# Create symlinks for Zellij config files
if [ -d "$DOTFILES_DIR/zellij" ]; then
  echo "Linking Zellij configuration..."
  rm -rf $HOME/.config/zellij
  ln -sfn "$DOTFILES_DIR/zellij" $HOME/.config/zellij
else
  echo "No Zellij configuration folder found in $DOTFILES_DIR. Skipping."
fi

# Define the font file URL
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/DroidSansMono.zip"
FONT_DIR="$HOME/Library/Fonts"
TMP_DIR="/tmp/DroidSansMono"

# Create a temporary directory to download and extract the font
echo "Creating temporary directory at $TMP_DIR..."
mkdir -p $TMP_DIR

# Download the font zip file
echo "Downloading DroidSansM Nerd Font..."
curl -L $FONT_URL -o "$TMP_DIR/DroidSansMono.zip"

# Unzip the font file
echo "Unzipping the font..."
unzip -o "$TMP_DIR/DroidSansMono.zip" -d $TMP_DIR

# Install the font to the user's fonts directory
echo "Installing the font to $FONT_DIR..."
cp -f $TMP_DIR/*.* $FONT_DIR

# Clean up temporary files
echo "Cleaning up temporary directory..."
rm -rf $TMP_DIR

echo "DroidSansM Nerd Font installation completed!"

# Ensure Homebrew is available in the current shell
eval "$($(brew --prefix)/bin/brew shellenv)"

# Install asdf via Homebrew
echo "Installing asdf..."
brew install asdf

# Add asdf to shell
if ! grep -q "asdf.sh" $HOME/.zshrc; then
  echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >>$HOME/.zshrc
fi
source "$(brew --prefix asdf)/libexec/asdf.sh"

# Install asdf plugins
echo "Adding asdf plugins..."
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add python https://github.com/danhper/asdf-python.git

# Install and set specific versions
echo "Installing Ruby 3.3.6..."
asdf install ruby 3.3.6
asdf set global ruby 3.3.6

echo "Installing Erlang 27.0..."
asdf install erlang 27.0
asdf set global erlang 27.0

echo "Installing Elixir 1.17.2..."
asdf install elixir 1.17.2
asdf set global elixir 1.17.2

echo "Installing Node.js 18.20.2..."
asdf install nodejs 18.20.2
asdf set global nodejs 18.20.2

echo "Installing Python 3.10.14..."
asdf install python 3.10.14
asdf set global python 3.10.14

# Reload asdf and validate installations
source "$(brew --prefix asdf)/libexec/asdf.sh"
echo "Installed versions:"
asdf list

echo "Setup done!"
