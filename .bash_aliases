# Editor
export EDITOR="code --wait"

# BetterUp tooling opt-outs
export BU_SKIP_HOOK_SETUP=1           # Skip bin/setup auto-installing betterup-monolith git hooks
export BETTERUP_COMPOUND_AUTO_FIRE=0  # Disable betterup-compound auto-fire
export BU_SESSIONS_UPLOAD_OPT_OUT=1   # Disable Claude Code transcript upload

# Prompt: add timestamp to every line (yellow, matches local zsh setup)
if [ -n "$BASH_VERSION" ]; then
  PS1='\[\e[33m\][\D{%Y-%m-%d} \t]\[\e[0m\] '"${PS1:-\u@\h:\w\$ }"
elif [ -n "$ZSH_VERSION" ]; then
  PROMPT='%{%F{yellow}%}[%D %*]%{%f%} '"${PROMPT}"
fi

# Common aliases
alias python=python3
alias ll='ls -alF'
alias la='ls -A'

# Git shortcuts
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline -20'
alias gp='git pull'
alias gc='git commit'
alias gco='git checkout'
alias gb='git branch'
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Rails shortcuts (for monolith development)
alias rc='bin/rails console'
alias rs='bin/rspec'
alias rr='bin/rubocop'
alias pk='bin/packwerk check'
alias tc='bin/test-changes'

# Flag completion for resume-claude (see bin/resume-claude). Completing the
# command name itself ("res"<Tab>) works out of the box once it's on PATH.
if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
  [ -n "$ZSH_VERSION" ] && { autoload -U +X bashcompinit 2>/dev/null && bashcompinit 2>/dev/null; }
  _resume_claude_complete() {
    local cur opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts="-t --task-id -d --dir -s --source -p --print -n --dry-run -h --help"
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
  }
  complete -F _resume_claude_complete resume-claude 2>/dev/null
fi
