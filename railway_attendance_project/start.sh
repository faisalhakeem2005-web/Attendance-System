#!/bin/sh
set -eu
# Initialize the demo database only on first boot; never overwrite existing data.
DB_FILE="${DB_PATH:-$(pwd)/attendance.db}"
if [ ! -f "$DB_FILE" ]; then
  python init_db.py
fi
exec gunicorn --bind "0.0.0.0:${PORT:-5000}" --workers 1 --threads 4 --timeout 120 app:app
