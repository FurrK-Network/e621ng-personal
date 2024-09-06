ROOT_DIR=$1
SCRIPT_DIR="$ROOT_DIR/scripts"
DUMP_DATA_DIR="$ROOT_DIR/dump"
ART_DATA_DIR_NAME="ART_DATA"
ART_DATA_DIR="$ROOT_DIR/$ART_DATA_DIR_NAME"
BACKUP_DIR="/mnt/c/Users/andyq/OneDrive/Documents/e6_DATA"
LOGS_DIR="$SCRIPT_DIR/logs"
echo "Script directory: $SCRIPT_DIR"
echo "Root directory: $ROOT_DIR"
echo "Art Data Dir: $ART_DATA_DIR"

if [ -d "$ART_DATA_DIR" ]; then
  echo "Backup directory exists. Copying."
  cp -rf $ART_DATA_DIR $ROOT_DIR
else
  if [ ! -d "$ART_DATA_DIR" ]; then
    echo "Creating Backup directory"
    echo "Created $ART_DATA_DIR"
    mkdir -p $ART_DATA_DIR/opensearch_data
    mkdir -p $ART_DATA_DIR/post_data
    mkdir -p $ART_DATA_DIR/redis_data_v2
    mkdir -p $ART_DATA_DIR/rubocop_cache
    echo "Created Backup directory"
  else
    echo "Backup directory exists. Skipping."
  fi
fi

if [ ! -d "$LOGS_DIR" ]; then
  echo "Creating logs directory"
  mkdir -p $LOGS_DIR
  echo "Created logs directory"
fi

echo "Running Setup of e621"
docker compose run --rm e621 /app/bin/setup
echo "Running Docker Compose Up"
docker compose up -d

echo "Running Initialization of RSync"
# sudo chmod 777 $ART_DATA_DIR/redis_data_v2/
$SCRIPT_DIR/init_rsync.sh $ART_DATA_DIR $BACKUP_DIR >$LOGS_DIR/init_rsync.log 2>&1

echo "Running Initialization of Database"
$SCRIPT_DIR/migrate_db.sh $DUMP_DATA_DIR >$LOGS_DIR/migrate_db.log 2>&1
exit 0
