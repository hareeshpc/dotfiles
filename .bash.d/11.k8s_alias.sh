alias k=kubectl
source <(kubectl completion bash | sed s/kubectl/k/g)

alias ka="kubectl -n apps-gui"
alias ke="kubectl -n egira-system"
alias ks="kubectl -n kube-system"
alias kgui="kubectl -n apps-gui"
alias kgpi="kubectl get pods -o custom-columns='NAME:metadata.name,IMAGES:spec.containers[*].image'"

