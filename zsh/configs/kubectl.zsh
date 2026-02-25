#
# Helpers to simplify using kubectl to shell to an api pod
#
#

function go_to_pod() {
    service=$1
    pod=$(kubectl get pods | grep -m 1 "${service}-api" | awk '{ print $1; }')

    echo "Shelling to pod ${pod}"
    kubectl exec -it ${pod} -- bash
}

alias gtpod="go_to_pod"
