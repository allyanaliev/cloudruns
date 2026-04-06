# Use a supported LTS version
FROM ubuntu:21.04

# Avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Combine commands to reduce layers and clean up cache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set up your custom page
RUN echo 'Docker Image on CloudRun of Denis Astahov!<br>' > /var/www/html/index.html && \
    echo '<b><font color="magenta">Version 1.1</font></b>' >> /var/www/html/index.html

# Standard Apache execution
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# Match Cloud Run's default port if you don't want to specify --port 80 during deploy
EXPOSE 80

