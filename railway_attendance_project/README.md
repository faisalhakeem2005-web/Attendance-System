# Student Attendance & Leave Approval System (DBMS PBL - Project 26)
Faisal Mohammed | 25WU0101161

## Run locally
```bash
python -m pip install -r requirements.txt
python init_db.py
python app.py
```
Open http://127.0.0.1:5000.

## Deploy to Railway
See [RAILWAY_DEPLOY.md](RAILWAY_DEPLOY.md). Railway configuration files are included. The startup script initializes sample data only if the configured SQLite database file does not exist.

## Project files
- `app.py` — Flask web application
- `schema.sql` — tables, indexes, triggers, views
- `sample_data.sql` — sample records
- `init_db.py` — creates the SQLite database (destructive if run on an existing DB)
- `build_sample.py` — deterministic sample SQL generator
- `queries.sql` — representative DBMS queries
- `test_app.py` — functional tests
- `test_results.json` — recorded test results
- `er_diagram.png` — ER diagram
- `requirements.txt`, `Procfile`, `railway.json`, `start.sh` — deployment configuration

**Demo limitation:** Login is a role selector without passwords. Use only as a demonstration project unless proper authentication is added.
