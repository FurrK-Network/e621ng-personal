CURRENT_DIR=$(pwd)
VOLUME_DIR=$1
BACKUP_DIR=$2

echo "Starting rsync Daemon to backup \"$VOLUME_DIR\" to \"$BACKUP_DIR\""
rsync -av --delete $VOLUME_DIR $BACKUP_DIR

exit 0
