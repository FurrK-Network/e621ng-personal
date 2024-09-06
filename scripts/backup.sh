#!/bin/bash

# Docker and PostgreSQL details
CONTAINER_NAME="e621ng-personal-postgres-1"
DB_NAME="e621_development"
DB_USER="e621"
DUMP_FILENAME="pg_dump.sql"
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
ROOT_DIR="$(dirname $SCRIPT_DIR)"
DUMP_DATA_DIR=$ROOT_DIR/dump
DUMP_DIR=${1-$DUMP_DATA_DIR}

echo "Dumping into $DUMP_DIR"

# Ensure the dump directory exists
mkdir -p $DUMP_DIR

# Perform data-only SQL dump inside the Docker container
echo "Performing data-only SQL dump..."
if ! docker exec $CONTAINER_NAME pg_dump -U $DB_USER -d $DB_NAME --data-only --inserts --no-owner --no-acl -T api_keys -T ar_internal_metadata -T bans -T blips -T dmail_filters -T dmains -T email_blacklists -T exception_logs -T forum_categories -T forum_post_votes -T forum_posts -T forum_subscriptions -T forum_topic_visits -T forum_topics -T ip_bans -T news_updates -T post_report_reasons -T schema_migrations -T takedowns -T tickets -T upload_whitelists -T user_feedback -T user_name_change_requests -T user_password_reset_nonces -T user_statuses -T schema_migrations_pkey >"$DUMP_DIR/$DUMP_FILENAME"; then
  echo "SQL dump failed."
  exit 1
fi

# Add the new dump to Git
git add "$DUMP_DIR/$DUMP_FILENAME"
git commit -m "Data-only database dump $DUMP_FILENAME"

echo "Pre-push checks passed. Data-only SQL dump created and committed."
exit 0
