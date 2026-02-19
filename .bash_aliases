# Editor
export EDITOR="code --wait"

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
