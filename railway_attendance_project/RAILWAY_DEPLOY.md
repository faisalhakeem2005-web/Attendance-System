# Railway deployment

## What caused the crash?
The Railway log says `ModuleNotFoundError: No module named 'flask'`. Railway started `app.py` without installing Flask. This package includes `requirements.txt` and a start command that installs/uses the declared dependencies through Railway's Nixpacks build.

## Deploy
1. Extract this ZIP.
2. Upload the extracted project to a GitHub repository (keep `requirements.txt`, `Procfile`, `railway.json`, and `start.sh` at the repository root).
3. In Railway, create a project and deploy from that GitHub repository.
4. Railway should detect Python and install `requirements.txt`; the start command runs `sh start.sh`.
5. Once deployment completes, open the generated public domain.

## Database persistence (important)
The app uses SQLite. Without a persistent volume, a redeploy/restart can lose data. For persistence, create a Railway Volume and mount it at `/data`, then add the Railway variable:
`DB_PATH=/data/attendance.db`
The startup script creates the sample database only if that file does not exist. Do not run `python init_db.py` against a database you want to keep; that script rebuilds the database.

## Optional environment variable
Set `SECRET_KEY` to a long random secret value in Railway Variables. The built-in role selector is a demo and does not provide real password authentication; do not use it for sensitive production data.

## Local test
```bash
python -m pip install -r requirements.txt
python init_db.py
python app.py
```
Then open http://127.0.0.1:5000.
