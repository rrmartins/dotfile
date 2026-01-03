#########################################################################################
# zsh-completions
#########################################################################################
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  # Initialize the zsh completion system
  # http://zsh.sourceforge.net/Doc/Release/Completion-System.html#Completion-System
  autoload -Uz compinit
  compinit


  # case insensitive path-completion
  # https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
  zstyle ':completion:*' matcher-list \
    'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
    'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' \

fi

[ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=243'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
MENU_COMPLETE=true



#########################################################################################
# ZSH History Settings
#########################################################################################
# https://scarff.id.au/blog/2019/zsh-history-conditional-on-command-success/
# Prevent the command from being written to history before it's
# executed; save it to LASTHIST instead.  Write it to history
# in precmd.
#
# called before a history line is saved.  See zshmisc(1).
function zshaddhistory() {
  # Remove line continuations since otherwise a "\" will eventually
  # get written to history with no newline.
  LASTHIST=${1//\\$'\n'/}
  # Return value 2: "... the history line will be saved on the internal
  # history list, but not written to the history file".
  return 2
}

# zsh hook called before the prompt is printed.  See zshmisc(1).
function precmd() {
  # Write the last command if successful, using the history buffered by
  # zshaddhistory().
  if [[ $? == 0 && -n ${LASTHIST//[[:space:]\n]/} && -n $HISTFILE ]] ; then
    print -sr -- ${=${LASTHIST%%'\n'}}
  fi
}

# History location.
export HISTFILE=~/.zsh_history

# It’s not possible to set the history to an unlimited size in zsh. The max
# history size can be the value of LONG_MAX variable from limits.h header,
# which is 9223372036854775807.
export HISTFILESIZE=9223372036854775800
export HISTSIZE=9223372036854775800

# Maximum number of items for the history file
export SAVEHIST=9223372036854775800

# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution

# Append history without exiting shell.
setopt inc_append_history
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

# Add Timestamp to history.
setopt extended_history

# When searching, skip duplicates and show each command only once.
setopt hist_find_no_dups

# To retrieve the history file everytime history is called upon. The only
# caveat is the need to press enter to fetch history.
setopt share_history



# integrating prompt function in prompt
precmd_functions=(__shhist_prompt $precmd_functions)



#########################################################################################
# Powerlevel10k
#########################################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" ] && source "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet



#########################################################################################
# Aliases
#########################################################################################
alias .dotfiles="cd $HOME/Dotfiles && nvim -c ':Neotree'"
alias .brewrc="nvim $HOME/Dotfiles/Brewfile"
alias .gitconfig="nvim $HOME/Dotfiles/git/config"
alias .nvimrc="nvim $HOME/Dotfiles/nvim/init.lua"
alias .zshrc="nvim $HOME/Dotfiles/zshrc"
alias .history="nvim $HOME/.zsh_history"

alias nvim-lazy="NVIM_APPNAME=nvim-lazy nvim"

# Show all the history stored with fzf.
alias history="fc -l 1 | fzf"



#########################################################################################
# Environment Variables
#########################################################################################
export XDG_CONFIG_HOME="$HOME/.config"
export HOMEBREW_BUNDLE_FILE="$HOME/Dotfiles/Brewfile"
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export PATH="$PATH:$HOME/.exo/bin" # https://github.com/deref/exo

[ -f "$HOME/Documents/Dotfiles/env-vars.sh" ] && source "$HOME/Documents/Dotfiles/env-vars.sh"



#########################################################################################
# Functions
#########################################################################################
function rubocop_changes() {
  git status --porcelain | sed s/^...// | xargs rubocop
}

function bundle_rubocop_changes() {
  git status --porcelain | sed s/^...// | xargs bundle exec rubocop
}

function rz() {
  echo "sourcing ~/.zshrc"
  source ~/.zshrc
}

function fixadguard() {
  sudo ifconfig lo0 up
}



#########################################################################################
# Homebrew
#########################################################################################
# Export these to your path because doctor said so! :)
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"



#########################################################################################
# Other
#########################################################################################
# Add fzf to shell
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# iTerm2's Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add direnv to shell
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# Add https://github.com/ajeetdsouza/zoxide
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi



#########################################################################################
# asdf - MUST BE LAST
#########################################################################################
# Get all available language versions rather than waiting someone to bump it
# https://github.com/asdf-vm/asdf-ruby/commit/af80345be901838ce2c6a58c6536a6fccc573b91
export ASDF_RUBY_BUILD_VERSION=master

# Add to shell
. $(brew --prefix asdf)/libexec/asdf.sh

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="nicoulaj"

plugins=(git docker docker-compose rails ruby mix mix-fast)

source $ZSH/oh-my-zsh.sh

[ -f ~/.zshrc_aliases ] && source ~/.zshrc_aliases

[ -f ~/.zprofile ] && source ~/.zprofile


export ES_JAVA_HOME=/opt/homebrew/Cellar/openjdk/22.0.1/libexec/openjdk.jdk/Contents/Home

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/llvm/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/libffi/include"
export LDFLAGS="-L/opt/homebrew/opt/snappy/lib"
export CPPFLAGS="-I/opt/homebrew/opt/snappy/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/snappy/lib/pkgconfig"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib -L/opt/homebrew/opt/readline/lib -L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include -I/opt/homebrew/opt/readline/include -I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:/opt/homebrew/opt/readline/lib/pkgconfig:/opt/homebrew/opt/libffi/lib/pkgconfig"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"

export ES_JAVA_HOME=/opt/homebrew/Cellar/openjdk/22.0.2/libexec/openjdk.jdk/Contents/Home