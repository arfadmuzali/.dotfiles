# ───────────────────────────────────────────────
# Powerlevel10k Instant Prompt
# ───────────────────────────────────────────────
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ───────────────────────────────────────────────
# Environment Setup
# ───────────────────────────────────────────────
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"

export ZSH="$HOME/.oh-my-zsh"

# Node Version Manager (NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# ───────────────────────────────────────────────
# Theme Configuration
# ───────────────────────────────────────────────
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment to customize prompt:
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ───────────────────────────────────────────────
# Oh My Zsh Plugins
# ───────────────────────────────────────────────
plugins=(git zsh-autosuggestions fast-syntax-highlighting fzf-tab)

source $ZSH/oh-my-zsh.sh

# ───────────────────────────────────────────────
# Aliases
# ───────────────────────────────────────────────
alias osu="~/Downloads/osu.AppImage"
alias ps2="~/Downloads/pcsx2.AppImage"
alias showimage="kitten icat"
alias open="xdg-open"
alias ls='eza --group-directories-first --color=auto'

# ───────────────────────────────────────────────
# Fuzzy Finder Helpers
# ───────────────────────────────────────────────
# alias ff='find ~ -type f 2>/dev/null | fzf --height=40% | wl-copy'
fcode() {
  local query="$1"
  local dir
  dir=$(fd . ~/projects ~/.dotfiles ~/learn --type d --hidden | fzf --height=40% --query="$query")
  [ -n "$dir" ] && code "$dir"
}

fn() {
  local query="$1"
  local dir
  dir=$(fd . ~/projects ~/.dotfiles ~/learn --type d --hidden --max-depth 3| fzf --height=70% --query="$query")
  [ -n "$dir" ] && nvim "$dir"
}

ff() {
  local query="$1"
  local dir
  dir=$(fd . ~/projects ~/.dotfiles ~/learn --type d --hidden | fzf --height=70% --query="$query")
  [ -n "$dir" ] && cd "$dir"
}

# ───────────────────────────────────────────────
# User Configuration (Optional)
# ───────────────────────────────────────────────
export LANG=en_US.UTF-8
export EDITOR="nvim"
export ARCHFLAGS="-arch $(uname -m)"

