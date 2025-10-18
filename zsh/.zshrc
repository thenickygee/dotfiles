# ============================================================================
# Amazon Q Pre Block
# ============================================================================
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# ============================================================================
# Powerlevel10k Instant Prompt
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

# OpenAI
#export OPENAI_API_KEY="xxx"
#export OPENAI_BASE_URL="http://10.0.0.116:1234/v1"
#export OPENAI_MODEL="qwen3-30b-a3b"
#export OPENAI_MODEL="gpt-oss-20b"

# ============================================================================
# PATH Modifications
# ============================================================================
# LM Studio CLI (lms)
export PATH="$PATH:/Users/nick/.lmstudio/bin"

# ============================================================================
# Custom Aliases
# ============================================================================
# General
alias vi="nvim"
alias c="clear"
alias check="clear && npm run test && npm run build"
alias start="pipenv run python app.py"
alias nodes="lsof -i -P -n | grep node"

# NPM
alias dev="npm run dev"
alias build="npm run build"

# Git
alias pull="git pull"
alias trim="git branch -D"
alias grow="git switch -C"
alias branch="git branch"
alias main="git switch main"
alias status="git status && git diff --stat"

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
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
