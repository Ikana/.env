# ── Homebrew ──────────────────────────────────────────────
# ARM Mac (Apple Silicon) vs Intel Mac vs Linux
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# ── Antigen ──────────────────────────────────────────────
if [ -f "$(brew --prefix 2>/dev/null)/share/antigen/antigen.zsh" ]; then
  source "$(brew --prefix)/share/antigen/antigen.zsh"
elif [ -f /usr/local/share/antigen/antigen.zsh ]; then
  source /usr/local/share/antigen/antigen.zsh
fi

antigen use oh-my-zsh

antigen bundle git

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen apply

# ── Prompt ───────────────────────────────────────────────
autoload -U promptinit; promptinit
prompt pure

# ── NVM ──────────────────────────────────────────────────
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ── Tokens / API keys ───────────────────────────────────
# Store secrets in a local-only file that is NOT committed:
#   ~/.zshrc.secrets
# Example contents:
#   export OPENAI_API_KEY=sk-...
#   export VERCEL_API_TOKEN=...
[ -f "$HOME/.zshrc.secrets" ] && source "$HOME/.zshrc.secrets"

# ── Aliases ──────────────────────────────────────────────
if command -v eza &>/dev/null; then
  alias ls='eza'
  alias la='eza --all'
  alias ll='eza -l'
  alias lll='eza -l | less'
  alias lla='eza -la'
  alias llt='eza -T'
  alias llfu='eza -bghHliS --git'
elif command -v exa &>/dev/null; then
  alias ls='exa'
  alias la='exa --all'
  alias ll='exa -l'
  alias lll='exa -l | less'
  alias lla='exa -la'
  alias llt='exa -T'
  alias llfu='exa -bghHliS --git'
fi

# ── Direnv ───────────────────────────────────────────────
command -v direnv &>/dev/null && eval "$(direnv hook zsh)"

# ── SDKMAN ───────────────────────────────────────────────
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ── Go ───────────────────────────────────────────────────
if command -v go &>/dev/null; then
  export GOPATH="${HOME}/.go"
  if command -v brew &>/dev/null; then
    export GOROOT="$(brew --prefix golang)/libexec"
  fi
  export PATH="$PATH:${GOPATH}/bin:${GOROOT:-/usr/local/go}/bin"
  test -d "${GOPATH}" || mkdir "${GOPATH}"
fi

# ── Rust / Cargo ─────────────────────────────────────────
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# ── Pyenv ────────────────────────────────────────────────
command -v pyenv &>/dev/null && export PATH="$(pyenv root)/shims:$PATH"

# ── Bun ──────────────────────────────────────────────────
if [ -d "$HOME/.bun" ]; then
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
  [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
fi

# ── Google Cloud SDK ─────────────────────────────────────
if [ -d "$HOME/google-cloud-sdk" ]; then
  [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ] && source "$HOME/google-cloud-sdk/path.zsh.inc"
  [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ] && source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

# ── Extra PATH ───────────────────────────────────────────
[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"
[ -d "/usr/local/sbin" ] && export PATH="/usr/local/sbin:$PATH"

# ── Style ────────────────────────────────────────────────
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# ── Local overrides (not committed) ─────────────────────
# Machine-specific config goes in ~/.zshrc.local
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
