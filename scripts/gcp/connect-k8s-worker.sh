#!/usr/bin/env bash

##################################################
# Thanks to ike
##################################################

if ! [ -x "$(command -v gcloud)" ]
then
  echo 'Need gcloud to run this'
  exit
fi
if ! [ -x "$(command -v fzf)" ]
then
  echo 'Need fzf to run this'
  exit
fi

### Functions
delete_expired_cache () {
  find "$1" -type f -name "$2" -mtime +7 -exec rm '{}' \;
}
##################################################
# Delete cache when
#   - Cache file expired for 1 day
#   - Manual with args
##################################################

# Get file name
FILE_NAME=$(basename "$0")
DIR_PATH="$(dirname "$0")/cache"
mkdir -p "$DIR_PATH"
CACHE_NAME="$FILE_NAME.cache"

# Get account name
NAME_CACHE_FILE="$CACHE_NAME.name"
NAME_CACHE_PATH="$DIR_PATH/$NAME_CACHE_FILE"
if [ ! -f "$NAME_CACHE_PATH" ]
then
  echo "Build name cache..."
  gcloud config list account --format "value(core.account)" | awk -F '@' '{print $1}' > "$NAME_CACHE_PATH"
fi
NAME=$(cat "$NAME_CACHE_PATH")
if [[ -z "$NAME" ]]
then
  echo 'Missing gcp account name!'
  exit
fi

# Get project id
PROJECT_CACHE_FILE="$CACHE_NAME.projects"
PROJECT_CACHE_PATH="$DIR_PATH/$PROJECT_CACHE_FILE"
delete_expired_cache "$DIR_PATH" "$PROJECT_CACHE_FILE"
if [ ! -f "$PROJECT_CACHE_PATH" ]
then
  echo "Build projects cache..."
  PROJECTS=$(gcloud projects list | grep -v 'PROJECT_ID')
  printf "%s" "$PROJECTS" > "$PROJECT_CACHE_PATH"
fi
PROJECT=$(<"$PROJECT_CACHE_PATH" fzf)
if [[ -z "$PROJECT" ]]
then
  exit
fi
CLOUDSDK_CORE_PROJECT=$(echo "$PROJECT" | awk '{print $1}')
export CLOUDSDK_CORE_PROJECT

# Get cluster name
CLUSTER_CACHE_FILE="$CACHE_NAME.cluster"
CLUSTER_CACHE_PATH="$DIR_PATH/$CLUSTER_CACHE_FILE"
delete_expired_cache "$DIR_PATH" "$CLUSTER_CACHE_FILE"
if [ ! -f "$CLUSTER_CACHE_PATH" ]; then
  echo "Build cluster cache"
  CLUSTERS=$(gcloud container clusters list --format "value(NAME, LOCATION, MASTER_IP)")
  printf "%s" "$CLUSTERS" > "$CLUSTER_CACHE_PATH"
fi
CLUSTER=$(<"$CLUSTER_CACHE_PATH" fzf)
CLUSTER_NAME=$(echo "$CLUSTER" | awk -F ' ' '{print $1}')
CLUSTER_TIMEZONE=$(echo "$CLUSTER" | awk -F ' ' '{print $2}')
if [[ -z "$CLUSTER_NAME" ]]; then
  exit
elif [[ -z "$CLUSTER_TIMEZONE" ]]; then
  exit
fi

# Switch cluster
gcloud container clusters get-credentials "$CLUSTER_NAME" \
--zone "$CLUSTER_TIMEZONE" \
--project "$CLOUDSDK_CORE_PROJECT"

# Get worker namespace
K8S_PODS_CACHE_JSON="$CACHE_NAME.k8s.pods.json"
K8S_PODS_CACHE_FILE="$CACHE_NAME.k8s.pods"
K8S_PODS_CACHE_JSONPATH="$DIR_PATH/$K8S_PODS_CACHE_JSON"
K8S_PODS_CACHE_PATH="$DIR_PATH/$K8S_PODS_CACHE_FILE"
delete_expired_cache "$DIR_PATH" "$K8S_PODS_CACHE_JSON"
delete_expired_cache "$DIR_PATH" "$K8S_PODS_CACHE_FILE"
if [ ! -f "$K8S_PODS_CACHE_PATH" ]; then
  echo "Build k8s pods cache"
  kubectl get pods -A -o json > "$K8S_PODS_CACHE_JSONPATH"
  jq -r '.items[] | select(.metadata.name | test("airflow-worker*")) | "\(.metadata.namespace) \(.metadata.name)"' "$K8S_PODS_CACHE_JSONPATH" > "$K8S_PODS_CACHE_PATH"
fi
K8S_POD=$(<"$K8S_PODS_CACHE_PATH" fzf)
K8S_POD_NAMESPACE=$(echo "$K8S_POD" | awk -F ' ' '{print $1}')
K8S_POD_NAME=$(echo "$K8S_POD" | awk -F ' ' '{print $2}')
rm "$K8S_PODS_CACHE_JSONPATH" "$K8S_PODS_CACHE_PATH"
kubectl exec --namespace="$K8S_POD_NAMESPACE" -it "$K8S_POD_NAME" bash
