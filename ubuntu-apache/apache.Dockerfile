# This Dockerfile sets up an Apache web server on Ubuntu 24.04
# It installs Apache, Python, Flask, and copies configuration files and HTML content.

# Using the official Ubuntu base image
FROM ubuntu:24.04

# Define the metadata for our image
LABEL author="CarrickCanCloud"
LABEL maintainer="CarrickCanCloud"
LABEL homepage="https://carrickcan.cloud"
LABEL license="GPL-3.0"
LABEL description="Apache web server on Ubuntu 24.04."
LABEL version="1.0"
LABEL build-date="2025-08-01"

# Install Apache and enable necessary modules
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    a2enmod headers

# Copy the start script into the container
COPY ./shell/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Copy images into the Apache web directory of the container
COPY ./apache/images/*.png /var/www/html/images/
COPY ./apache/images/*.svg /var/www/html/images/

# Copy Apache configuration files into the container
COPY ./apache/conf/apache.conf /etc/apache2/sites-available/000-default.conf
COPY ./apache/conf/security.conf /etc/apache2/conf-available/security.conf

# Expose port 80 for HTTP traffic
EXPOSE 80

# Run the start script
CMD ["/usr/local/bin/start.sh"]
