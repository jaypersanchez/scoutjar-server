#!/bin/bash

# Exit on any error
set -e

# Disable paging in psql output
export PAGER=cat

# Define DB connection parameters (adjust as needed)
HOST=localhost
USER=postgres
DB=postgres

# Run scripts in correct order
echo "▶️ Cleaning orphaned records..."
psql -h $HOST -U $USER -d $DB -f ../cleanup/2025-05-16-clean-orphaned-talent-jobs-applications.sql

echo "🔐 Enforcing user-profile relationships..."
psql -h $HOST -U $USER -d $DB -f 2025-05-16-ensure-user-profile-relations-fk.sql

echo "🔐 Enforcing jobs + applications foreign keys..."
psql -h $HOST -U $USER -d $DB -f 2025-05-16-ensure-jobs-and-applications-fk.sql

echo "🔐 Enforcing jobs.recruiter_id foreign key..."
psql -h $HOST -U $USER -d $DB -f ../cleanup/2025-05-16-add-fk-jobs-recruiter.sql

echo "🚀 Applying performance indexes..."
psql -h $HOST -U $USER -d $DB -f ../performance/2025-05-16-add-performance-indexes.sql

echo "📦 Exporting schema snapshot..."
bash ../export/2025-05-16-export-full-schema.sh

echo "✅ Migration complete!"
