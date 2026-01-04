#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${DOTFILES_DIR:-$(cd "$(dirname "$0")" && pwd)}"
errors=0

echo "Using DOTFILES_DIR=$DOTFILES_DIR"
#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${DOTFILES_DIR:-$(cd "$(dirname "$0")" && pwd)}"
errors=0

echo "Using DOTFILES_DIR=$DOTFILES_DIR"

ensure_brew() {
  if command -v brew >/dev/null 2>&1; then
    echo "[brew] Homebrew found"
    return 0
  fi
  echo "[brew] Homebrew not found — attempting install"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
    echo "[brew] Homebrew install failed"
    errors=$((errors+1))
    return 1
  }
  # try to load brew into this shell
  if brew --prefix >/dev/null 2>&1; then
    eval "$("$(brew --prefix)"/bin/brew shellenv)" || true
  fi
  echo "[brew] Homebrew installed"
}

install_brewfile() {
  if [ ! -f "$DOTFILES_DIR/Brewfile" ]; then
    echo "[brew] Brewfile not found in $DOTFILES_DIR"
    errors=$((errors+1))
    return 1
  fi
  echo "[brew] Ensuring Brewfile items are installed..."
  brew bundle --file="$DOTFILES_DIR/Brewfile" || {
    echo "[brew] brew bundle returned non-zero"
    errors=$((errors+1))
    return 1
  }
  echo "[brew] Brewfile items installed"
}

ensure_zellij() {
  if command -v zellij >/dev/null 2>&1; then
    echo "[zellij] zellij installed"
    return 0
  fi
  if ! command -v brew >/dev/null 2>&1; then
    echo "[zellij] brew missing — cannot install zellij automatically"
    errors=$((errors+1))
    return 1
  fi
  echo "[zellij] Installing zellij via brew..."
  brew install zellij || {
    echo "[zellij] install failed"
    errors=$((errors+1))
    return 1
  }
  echo "[zellij] installed"
}

ensure_shell_tools() {
  if ! command -v brew >/dev/null 2>&1; then
    echo "[brew] brew missing — skipping shell tools"
    return 0
  fi
  pkgs=(zsh-autosuggestions zsh-syntax-highlighting powerlevel10k direnv zoxide fzf asdf)
  for p in "${pkgs[@]}"; do
    if brew list --formula | grep -q "^${p}$" >/dev/null 2>&1; then
      echo "[brew] $p already installed"
    else
      echo "[brew] Installing $p"
      brew install "$p" || { echo "[brew] install $p failed"; errors=$((errors+1)); }
    fi
  done
  if [ -d "$(brew --prefix)/opt/fzf" ]; then
    "$(brew --prefix)/opt/fzf/install" --key-bindings --completion --no-update-rc || true
  fi
}

ensure_asdf_and_plugins() {
  if ! command -v asdf >/dev/null 2>&1; then
    if command -v brew >/dev/null 2>&1; then
      echo "[asdf] Installing asdf via brew..."
      brew install asdf || { echo "[asdf] install failed"; errors=$((errors+1)); return 1; }
    else
      echo "[asdf] asdf missing and brew not available"
      errors=$((errors+1))
      return 1
    fi
  fi

  # source asdf if possible
  if [ -f "$(brew --prefix asdf 2>/dev/null)/libexec/asdf.sh" ]; then
    # shellcheck disable=SC1090
    source "$(brew --prefix asdf)/libexec/asdf.sh"
  elif command -v asdf >/dev/null 2>&1; then
    : # asdf is in PATH
  fi

  plugins=(ruby elixir erlang nodejs python)
  for p in "${plugins[@]}"; do
    if asdf plugin-list | grep -q "^${p}$"; then
      echo "[asdf] plugin ${p} present"
    else
      echo "[asdf] adding plugin ${p}"
      asdf plugin add "$p" || { echo "[asdf] plugin add $p failed"; errors=$((errors+1)); }
    fi
  done

  # use indexed arrays for compatibility with older bash (/bin/sh or bash <4)
  want_keys=(ruby erlang elixir nodejs python)
  want_vals=(3.3.6 27.0 1.17.2 18.20.2 3.10.14)

  for i in "${!want_keys[@]}"; do
    p="${want_keys[$i]}"
    ver="${want_vals[$i]}"
    if asdf list "$p" 2>/dev/null | grep -q "$ver"; then
      echo "[asdf] $p $ver installed"
    else
      echo "[asdf] Installing $p $ver"
      asdf install "$p" "$ver" || { echo "[asdf] install $p $ver failed"; errors=$((errors+1)); continue; }
      asdf set global "$p" "$ver" || true
    fi
  done
}

ensure_symlinks() {
  checks=(
    "$HOME/.zshrc:$DOTFILES_DIR/zshrc"
    "$HOME/.zshrc_aliases:$DOTFILES_DIR/zshrc_aliases"
    "$HOME/.p10k.zsh:$DOTFILES_DIR/p10k.zsh"
    "$HOME/.config/nvim/init.lua:$DOTFILES_DIR/nvim/init.lua"
    "$HOME/.config/zellij:$DOTFILES_DIR/zellij"
  )
  for entry in "${checks[@]}"; do
    IFS=":" read -r path target <<< "$entry"
    if [ -e "$target" ]; then
      if [ -L "$path" ]; then
        real=$(readlink -f "$path" || realpath "$path" 2>/dev/null || true)
        expected=$(readlink -f "$target" || realpath "$target" 2>/dev/null || true)
        if [ "$real" = "$expected" ]; then
          echo "[link] $path -> ok"
          continue
        fi
      fi
      echo "[link] Creating symlink $path -> $target"
      mkdir -p "$(dirname "$path")"
      ln -sfn "$target" "$path" || { echo "[link] failed to link $path"; errors=$((errors+1)); }
    else
      echo "[link] target $target does not exist — skipping $path"
      errors=$((errors+1))
    fi
  done
}

echo "Starting install+validation..."
ensure_brew || true
ensure_shell_tools || true
install_brewfile || true
ensure_zellij || true
ensure_asdf_and_plugins || true
ensure_symlinks || true

if [ "$errors" -eq 0 ]; then
  echo "All checks passed and missing items installed where possible"
  exit 0
else
  echo "Finished with $errors issue(s); review output above"
  exit 2
fi
