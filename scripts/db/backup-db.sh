#!/bin/bash

# Path to project root where .env is located
PROJECT_ROOT="$(dirname "$(dirname "$(realpath "$0")")")"

# Load environment variables from .env
export $(grep -v '^#' "$PROJECT_ROOT/.env" | xargs)

# Timestamp for backup file
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Backup directory
BACKUP_DIR="/var/backups/scoutjar"
mkdir -p "$BACKUP_DIR"

# File name
FILENAME="scoutjar_backup_$TIMESTAMP.dump"
FILEPATH="$BACKUP_DIR/$FILENAME"

# Dump the database using pg_dump in custom format (-F c)
PGPASSWORD=$POSTGRES_PASSWORD pg_dump \
  -U "$POSTGRES_USER" \
  -h "$POSTGRES_HOST" \
  -p "$POSTGRES_PORT" \
  -F c -b -v \
  -f "$FILEPATH" \
  "$POSTGRES_DB"

# Check if the dump succeeded
if [ $? -ne 0 ]; then
  echo "❌ Backup failed at $TIMESTAMP"
  exit 1
fi

echo "✅ Backup created: $FILEPATH"

# Upload to GCS
if [ ! -z "$GCS_BUCKET_NAME" ]; then
  gsutil cp "$FILEPATH" gs://$GCS_BUCKET_NAME/
  if [ $? -eq 0 ]; then
    echo "📤 Uploaded to GCS bucket: gs://$GCS_BUCKET_NAME/"
  else
    echo "⚠️ Failed to upload to GCS"
  fi
fi

# Cleanup old backups (older than 7 days)
find "$BACKUP_DIR" -type f -name "*.dump" -mtime +7 -exec rm -f {} \;

echo "🧹 Old backups cleaned"
