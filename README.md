# Automate-Your-Python-Scripts-with-Cron-and-Docker
I’ll walk you through how to automate Python script execution using cron jobs inside a Docker container. This approach is super handy when you want to schedule periodic tasks reliably and in a reproducible environment.

Why Use Cron + Docker for Python Script Scheduling?
Cron is the classic UNIX utility for scheduling recurring tasks.
Docker helps package your Python environment and scripts so they run the same anywhere.
Combining both means you get a lightweight, portable scheduler without relying on your host machine’s setup.
Perfect for automation tasks like data fetching, backups, report generation, or any repeated jobs.

Project Overview
Write a simple Python script (script.py) that prints a timestamp to the console.
Set up a cron job inside a Docker container to run the script every minute.
Build and run the container to see cron trigger your Python script repeatedly.

Step 1: Create the Python Script
This script appends the current timestamp to a log file.

Step 2: Write the Dockerfile
Your Dockerfile needs to: Use a lightweight Linux base image
Install Python and cron
Copy the Python script and a cron config file
Start cron in the foreground

Step 3: Define the Cron Job
Create a file named cronjob in your project directory:
* * * * * root python /usr/local/bin/script.py

This means: run the Python script every minute as the root user.
Make sure this file has no extra blank lines at the end.

Step 4: Build and Run the Docker Container
Run these commands from your project folder
docker build -t python-cron .
docker run -d --name python-cron-container python-cron

Your container will now run the script every minute and log timestamps to /var/log/cron_python.log inside the container.

Step 5: Check the Logs
To see the output logs, execute:
docker exec -it python-cron-container tail -f /var/log/cron_python.log

You should see a new timestamp logged every minute.

Bonus: Customizing Your Schedule
You can easily tweak the cron schedule inside the cronjob file to run at different intervals, like every 5 minutes:
*/5 * * * * root python /usr/local/bin/script.py


Final Thoughts
Combining cron with Docker is a powerful way to automate tasks in a predictable, portable environment. You can extend this setup for complex Python jobs or integrate it into your CI/CD pipelines.

If you liked this project, stay tuned for more Day2 projects to boost your dev productivity!

you can read the deatiled artical - https://nandiniduggineni.hashnode.dev/automate-your-python-scripts-with-cron-and-docker
