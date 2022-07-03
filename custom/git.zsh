function git_current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

alias ga='git add'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gco='git checkout'
alias gd='git diff'
alias gdca='git diff --cached'
alias glg='git log --stat'
alias gp='git push'
alias gp!='git push --force'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias grb='git rebase'
alias gss='git status -s'
