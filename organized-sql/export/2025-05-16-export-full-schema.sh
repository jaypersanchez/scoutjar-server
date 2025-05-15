#!/bin/bash
# Example 
# ../export/2025-05-16-export-full-schema.sh [host] [user] [database]
# ../export/2025-05-16-export-full-schema.sh localhost postgres scoutjar

# Default connection parameters (can be overridden with CLI args)
HOST=${1:-localhost}
USER=${2:-postgres}
DB=${3:-postgres}

# Output file with timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
OUTPUT_DIR="$(dirname "$0")"
OUTPUT_FILE="${OUTPUT_DIR}/backup_${DB}_${TIMESTAMP}.sql"

# Perform full schema + data dump
pg_dump -h $HOST -U $USER -d $DB --no-owner --no-privileges > "$OUTPUT_FILE"

echo "✅ Backup complete: $OUTPUT_FILE"
