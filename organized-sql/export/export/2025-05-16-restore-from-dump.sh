#!/bin/bash

# Usage:
# ./2025-05-16-restore-from-dump.sh [dump_file.sql] [host] [user] [database]
# ./2025-05-16-restore-from-dump.sh backup_scoutjar_2025-05-16_13-47-02.sql localhost postgres scoutjar

# Arguments with default fallbacks
DUMP_FILE=$1
HOST=${2:-localhost}
USER=${3:-postgres}
DB=${4:-postgres}

# Check for dump file parameter
if [[ -z "$DUMP_FILE" ]]; then
  echo "❌ Error: No dump file specified."
  echo "Usage: $0 <dump_file.sql> [host] [user] [database]"
  exit 1
fi

# Full path to dump file
DUMP_PATH="$(dirname "$0")/$DUMP_FILE"

# Check if dump file exists
if [[ ! -f "$DUMP_PATH" ]]; then
  echo "❌ Error: Dump file not found: $DUMP_PATH"
  exit 2
fi

# Confirm with user
echo "🚨 WARNING: This will restore the database '$DB' using:"
echo "  ↳ Host: $HOST"
echo "  ↳ User: $USER"
echo "  ↳ File: $DUMP_PATH"
read -p "⚠️  Are you sure you want to proceed? [y/N]: " CONFIRM

if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
  echo "❌ Cancelled."
  exit 3
fi

# Restore
echo "🔁 Restoring database from dump..."
psql -h "$HOST" -U "$USER" -d "$DB" -f "$DUMP_PATH"

echo "✅ Restore complete."
