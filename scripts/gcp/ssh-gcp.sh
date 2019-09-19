#!/usr/bin/env bash

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
###

# Delete cache when
  # - Cache file expired for 1 day
  # - Manual with args

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

# Get host
HOST_CACHE_FILE="$PROJECT_CACHE_FILE.$CLOUDSDK_CORE_PROJECT"
HOST_CACHE_PATH="$DIR_PATH/$HOST_CACHE_FILE"
delete_expired_cache "$DIR_PATH" "$HOST_CACHE_FILE"
if [ ! -f "$HOST_CACHE_PATH" ]
then
  echo "Build host cache..."
  HOSTS=$(gcloud compute instances list | grep RUNNING)
  printf "%s" "$HOSTS" > "$HOST_CACHE_PATH"
fi
HOST=$(<"$HOST_CACHE_PATH" fzf)
if [[ -z "$HOST" ]]
then
  exit
fi
IP=$(echo "$HOST" | awk '{print $(NF-1)}')

# SSH
CONNECT="$NAME@$IP"
printf "Connect to %s...\n" "$HOST"
ssh "$CONNECT"
