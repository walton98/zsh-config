alias keit='kubectl exec -it'

alias kgp='kubectl get pods'
alias kdp='kubectl describe pods'
alias kdelp='kubectl delete pods'
alias kep='kubectl edit pods'

alias kgs='kubectl get svc'
alias kds='kubectl describe svc'
alias kdels='kubectl delete svc'
alias kes='kubectl edit svc'

alias kgi='kubectl get ingress'
alias kdi='kubectl describe ingress'
alias kdeli='kubectl delete ingress'
alias kei='kubectl edit ingress'

alias kgsec='kubectl get secret'
alias kdsec='kubectl describe secret'
alias kdelsec='kubectl delete secret'
alias kesec='kubectl edit secret'

alias kgd='kubectl get deployment'
alias kdd='kubectl describe deployment'
alias kdeld='kubectl delete deployment'
alias ked='kubectl edit deployment'

alias kl='kubectl logs'
alias kl1h='kubectl logs --since 1h'
alias kl1m='kubectl logs --since 1m'

kubectl_completion() {
  # store completion in cache since it takes ~0.2s to load
  COMPLETION_CACHE=$ZSH_PLUGIN_DIR/kubectl/completion.zsh
  if [ ! -f $COMPLETION_CACHE ]; then
    echo "Updating kubectl completion cache"
    mkdir -p $(dirname $COMPLETION_CACHE)
    kubectl completion zsh > $COMPLETION_CACHE
  fi
  source $COMPLETION_CACHE
}
