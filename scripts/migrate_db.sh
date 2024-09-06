DUMP_DIR=$1

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
ROOT_DIR="$(dirname $SCRIPT_DIR)"
DUMP_DATA_DIR=$ROOT_DIR/dump
DUMP_DIR=${1-$DUMP_DATA_DIR}
DUMP_FILENAME="pg_dump.sql"


if [ ! -f $DUMP_DIR/pg_dump.sql ]; then
  echo "Dump file not found at $DUMP_DIR/pg_dump.sql"
  exit 0
fi
echo "Dump file found at $DUMP_DIR/pg_dump.sql"
echo "Restoring database from dump file"
docker exec -i e621ng-personal-postgres-1 psql -U e621 -d e621_development < $DUMP_DIR/$DUMP_FILENAME