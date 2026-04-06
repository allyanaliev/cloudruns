# Use a supported LTS version (24.04 is the latest)
FROM ubuntu:24.04

# Avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Combine commands, clean cache, and fix the Apache PID directory issue
RUN apt-get update && \
    apt-get install -y apache2 && \
    mkdir -p /var/run/apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set up your custom page
RUN echo 'Docker Image on CloudRun of Denis Astahov!<br>' > /var/www/html/index.html && \
    echo '<b><font color="magenta">Version 1.1</font></b>' >> /var/www/html/index.html

# Standard Apache execution
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# Port 80 for Apache (Ensure you deploy Cloud Run with --port=80)
EXPOSE 80


