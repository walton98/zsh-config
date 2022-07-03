export smk="$HOME/smarkets"

# Access local dbs
function pg() {
  SERVICE="$1"
  case "$1" in
    "")
      echo "No service name specified."
      return 1
      ;;
    user)
      SERVICE="user_service"
      ;;
    otc)
      SERVICE="multiplesotc"
      ;;
  esac
  HOST=$(kubectl get service infrastructure-services-db-postgresql -o jsonpath='{.spec.clusterIP}')
  PORT=$(kubectl get service infrastructure-services-db-postgresql -o jsonpath='{.spec.ports[0].port}')
  PGPASSWORD=$SERVICE pgcli -h $HOST -p $PORT -U $SERVICE
}


# Access prod/staging dbs
function db() {
  SERVICE="$1"
  REPLICA="$2"
  ENVIRONMENT="${3:-prod}"
  case "$1" in
    "")
      echo "No service name specified."
      return 1
      ;;
    user)
      ROLE="user_service"
      ;;
    stream-rg)
      ROLE="stream_rg"
      ;;
    *)
      ROLE=$SERVICE
  esac
  ssh -t $ENVIRONMENT "export KUBECONFIG=~/.kube/kubeconfig; kubectl exec -it pyms-$SERVICE-db-$REPLICA -- psql -U $ROLE"
}

export NODE_EXTRA_CA_CERTS=$smk/etc/ca-certificates/Cloudflare_CA.crt
