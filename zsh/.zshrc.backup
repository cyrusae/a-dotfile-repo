# ============================================================================
# BASIC ZSH SETTINGS
# ============================================================================
# These should come first - they set fundamental shell behavior

setopt autocd              # cd by typing directory name
setopt hist_ignore_dups    # Don't save duplicate commands in history
setopt share_history       # Share history across all zsh sessions
setopt extended_glob       # Enable extended globbing (advanced pattern matching)

# History configuration
HISTSIZE=10000            # Number of commands to remember in current session
SAVEHIST=10000            # Number of commands to save to history file
HISTFILE=~/.zsh_history   # Where to save history


# ============================================================================
# ENVIRONMENT VARIABLES
# ============================================================================
# Export these before initializing tools so they see the right environment
#
# Path variables
export PATH="$HOME/.cargo/bin:$PATH" # Use cargo for Rust packages

# Kubernetes config (from your .bashrc)
export KUBECONFIG=~/.kube/config

# Color support (ensures colors work properly, especially over SSH)
export COLORTERM=truecolor
export STARSHIP_FORCE_COLORS=1

# Man pages viewer - use bat for syntax-highlighted man pages
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

# fzf configuration - set BEFORE sourcing fzf so it uses these settings
export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--preview 'batcat --color=always --style=numbers --line-range=:500 {}'"


# ============================================================================
# ALIASES
# ============================================================================
# Define aliases before functions that might use them

# Ubuntu-specific tool name corrections
alias bat='batcat'
alias fd='fdfind'

# Modern CLI replacements (eza for ls)
alias ls='eza --color=always --group-directories-first'
alias ll='eza -lh --color=always --group-directories-first --git'
alias la='eza -alh --color=always --group-directories-first --git'
alias lt='eza -aT --color=always --group-directories-first'
alias l='eza -lah --color=always --group-directories-first --git'

# Colored grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Custom utility aliases
# alias k8s-backup='~/scripts/k8s-export-all.sh' # Easy k8s backup (see script for mechanics) # no longer relevant
alias mkdir='mkdir -p' # Always create parent directory if needed 

# kubectl shortcuts
alias k='kubectl'
alias kg='kubectl get'

alias kgp='kubectl get pods -o wide'
alias kgpa='kubectl get pods -A -o wide'

alias kgs='kubectl get svc'
alias ksvc='kubectl get svc'
alias kgsa='kubectl get svc -A'

alias kgi='kubectl get ingress'
alias kgin='kubectl get ingress'
alias kgia='kubectl get ingress -A'

alias kgn='kubectl get nodes -o wide'

# I have no trust in my own ability to remember what I shortcut this to
alias kd='kubectl describe'
alias kdes='kubectl describe'
alias kdesc='kubectl describe'

alias kl='kubectl logs'

# Once again I do not trust my memory
alias kx='kubectl exec -it'
alias kexec='kubectl exec -it'

alias kdel='kubectl delete'

# ============================================================================
# FUNCTIONS
# ============================================================================
# Functions come after aliases they might depend on

# Use etcdctl against K3s's will
etcdctl-k3s() {
  sudo etcdctl --endpoints=https://127.0.0.1:2379 \
    --cert=/var/lib/rancher/k3s/server/tls/etcd/server-client.crt \
    --key=/var/lib/rancher/k3s/server/tls/etcd/server-client.key \
    --cacert=/var/lib/rancher/k3s/server/tls/etcd/server-ca.crt \
    "$@"
}
alias use-etcdctl='etcdctl-k3s' 
# backup in case I forget the key

# ============================================================================
# TOOL INITIALIZATIONS
# ============================================================================
# Initialize tools that modify your shell environment
# These use eval because they generate shell code dynamically

# Starship prompt - makes your prompt pretty
eval "$(starship init zsh)"

# Zoxide - smart cd that learns your frecent directories
eval "$(zoxide init zsh)"


# ============================================================================
# FZF - FUZZY FINDER
# ============================================================================
# Source fzf AFTER setting FZF_* environment variables above

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh


# ============================================================================
# ZSH PLUGINS
# ============================================================================
# Load plugins last (syntax-highlighting MUST be last)

# Fish-like autosuggestions from history
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# CRITICAL: This must be the LAST plugin sourced
# Syntax highlighting colors your commands as you type
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# ============================================================================
# AUTO-START TOOLS (OPTIONAL)
# ============================================================================
# These modify shell startup behavior, so they go at the very end

# 1. Ensure we aren't already inside Zellij
# 2. Check if the parent process ($PPID) is mosh-server
if [[ -z "$ZELLIJ" ]]; then
    if ps -p $PPID -o comm= | grep -q "mosh-server"; then
        zellij attach -c || zellij
    fi
fi
