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
export NNN_PLUG='p:preview-tui'
export NNN_FIFO="/tmp/nnn.fifo"

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
plugins=(
  git
)
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
alias ff='find ~ -type f 2>/dev/null | fzf --height=40% | wl-copy'

fcode() {
  local query="$1"
  local dir
  dir=$(find ~ -type d 2>/dev/null | fzf --height=40% --query="$query")
  [ -n "$dir" ] && code "$dir"
}

fn() {
  local query="$1"
  local dir
  dir=$(find ~ -type d 2>/dev/null | fzf --height=40% --query="$query")
  [ -n "$dir" ] && nvim "$dir"
}

fd() {
  local query="$1"
  local dir
  dir=$(find ~ -type d 2>/dev/null | fzf --height=40% --query="$query")
  [ -n "$dir" ] && cd "$dir"
}

# ───────────────────────────────────────────────
# User Configuration (Optional)
# ───────────────────────────────────────────────
export LANG=en_US.UTF-8
export EDITOR="nvim"
export ARCHFLAGS="-arch $(uname -m)"

# ───────────────────────────────────────────────
# Zinit Plugin Manager
# ───────────────────────────────────────────────
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
	print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Zinit…%f"
	command mkdir -p "$HOME/.local/share/zinit"
	command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" \
		&& print -P "%F{33}%F{34}Installation successful.%f%b" \
		|| print -P "%F{160}The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

  # Load Plugins
  zinit light zsh-users/zsh-autosuggestions
  zinit light zsh-users/zsh-syntax-highlighting
  zinit light zsh-users/zsh-completions
  zinit light Aloxaf/fzf-tab

  autoload -Uz compinit && compinit
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit

