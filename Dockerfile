FROM python:3.9-slim

# Install cron
RUN apt-get update && apt-get install -y cron

# Copy script and cron config
COPY script.py /usr/local/bin/script.py
COPY cronjob /etc/cron.d/cronjob

# Give execution rights
RUN chmod +x /usr/local/bin/script.py

# Apply cron job and permissions
RUN crontab /etc/cron.d/cronjob
RUN touch /var/log/cron_python.log

# Run the command on container startup
CMD ["cron", "-f"]
