
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

# ============================================================================
# Amazon Q Pre Block (Keep at the top)
# ============================================================================
# ============================================================================
# Powerlevel10k Instant Prompt (Must stay near the top)
# ============================================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================================
# Oh My Zsh Configuration
# ============================================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# ============================================================================
# Environment Variables
# ============================================================================
# Editor
export EDITOR="nvim"

# Docker and Colima
export COLIMA_VM="default"
export COLIMA_VM_SOCKET="${HOME}/.colima/${COLIMA_VM}/docker.sock"
export DOCKER_HOST="unix://${COLIMA_VM_SOCKET}"

# OpenAI (commented out)
#export OPENAI_API_KEY="dummy_key"
#export OPENAI_BASE_URL="http://10.0.0.116:1234/v1"
#export OPENAI_MODEL="qwen3-30b-a3b"
#export OPENAI_MODEL="gpt-oss-20b"

# ============================================================================
# PATH Modifications
# ============================================================================
# LM Studio CLI (lms)
export PATH="$PATH:/Users/nick/.lmstudio/bin"

export PATH="$PATH:$(go env GOPATH)/bin"

# ============================================================================
# Custom Aliases
# ============================================================================
# General
alias vi="nvim"
alias c="clear"
alias e="exit"
alias check="clear && npm run test && npm run build"
alias s="pipenv run python app.py"
alias nodes="lsof -i -P -n | grep node"
alias co="copilot"
alias oc="opencode"
alias ta="tmux attach"
alias lll="ls -lhA | awk '{print \$9, \$5}' | column -t"

# NPM
alias d="npm run dev"
alias npml="npm run lint"
alias npmf="npm run format"
alias npmb="npm run build"
alias npmt="npm run test"

# NPX
alias npt="npx playwright test"
alias nps="npx playwright show-report"

# Git
alias p="git pull"
alias trim="git branch -D"
alias grow="git switch -C"
alias branch="git branch"
alias m="git switch main"
alias status="git status && git diff --stat"
alias configs="git config user.name && git config user.email"
alias slint="git diff --cached --name-only --diff-filter=ACMR | grep -E '\.(js|jsx|ts|tsx)$' | xargs -I{} npx next lint --file {}"

# ============================================================================
# Tool Initializations
# ============================================================================
# Atuin
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Direnv
eval "$(direnv hook zsh)"

# ============================================================================
# Theme Configuration
# ============================================================================
# Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ============================================================================
# Amazon Q Post Block 
# ============================================================================
# Added by Antigravity
export PATH="/Users/nick/.antigravity/antigravity/bin:$PATH"

# Create a new git worktree branched off main, with env files symlinked and deps installed
wt() {
  local branch="$1"
  if [[ -z "$branch" ]]; then
    echo "Usage: wt <branch-name>"
    return 1
  fi
  local main_dir="$(git rev-parse --show-toplevel 2>/dev/null)"
  if [[ -z "$main_dir" ]]; then
    echo "Not inside a git repository"
    return 1
  fi
  local new_dir="${main_dir}-${branch}"

  git fetch origin main
  git worktree add -b "$branch" "$new_dir" origin/main || return 1
  [[ -f "$main_dir/.env" ]] && ln -sf "$main_dir/.env" "$new_dir/.env"
  npm install --prefix "$new_dir"
  echo "Worktree ready at $new_dir"
}

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
