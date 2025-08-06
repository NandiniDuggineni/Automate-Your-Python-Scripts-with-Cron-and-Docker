from datetime import datetime

with open("/var/log/cron_python.log", "a") as f:
    f.write(f"Cron job executed at {datetime.now()}\n")
