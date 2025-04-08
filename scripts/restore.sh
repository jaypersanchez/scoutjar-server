#!/bin/bash

# Path to project root where .env is located
PROJECT_ROOT="$(dirname "$(dirname "$(realpath "$0")")")"

# Load environment variables from .env
export $(grep -v '^#' "$PROJECT_ROOT/.env" | xargs)

# Backup directory
BACKUP_DIR="/var/backups/scoutjar"

# Accept filename as an argument or use latest
if [ "$1" ]; then
  RESTORE_FILE="$BACKUP_DIR/$1"
else
  RESTORE_FILE=$(ls -t "$BACKUP_DIR"/*.dump 2>/dev/null | head -n 1)
fi

# Validate file exists
if [ ! -f "$RESTORE_FILE" ]; then
  echo "❌ Backup file not found: $RESTORE_FILE"
  echo "Usage: ./restore.sh [optional-filename.dump]"
  exit 1
fi

echo "⚠️ WARNING: This will overwrite the current '$POSTGRES_DB' database!"
read -p "Type 'yes' to continue: " CONFIRM
if [[ "$CONFIRM" != "yes" ]]; then
  echo "Restore aborted."
  exit 0
fi

# Drop the existing DB and recreate it
echo "📛 Dropping and recreating database $POSTGRES_DB..."
PGPASSWORD=$POSTGRES_PASSWORD dropdb -U "$POSTGRES_USER" -h "$POSTGRES_HOST" -p "$POSTGRES_PORT" "$POSTGRES_DB"
PGPASSWORD=$POSTGRES_PASSWORD createdb -U "$POSTGRES_USER" -h "$POSTGRES_HOST" -p "$POSTGRES_PORT" "$POSTGRES_DB"

# Restore the backup using pg_restore
echo "♻️ Restoring from $RESTORE_FILE..."
PGPASSWORD=$POSTGRES_PASSWORD pg_restore \
  -U "$POSTGRES_USER" \
  -h "$POSTGRES_HOST" \
  -p "$POSTGRES_PORT" \
  -d "$POSTGRES_DB" \
  -v "$RESTORE_FILE"

if [ $? -eq 0 ]; then
  echo "✅ Database successfully restored from: $RESTORE_FILE"
else
  echo "❌ Restore failed."
fi
