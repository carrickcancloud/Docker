# ------------------
# --- Base stage ---
# ------------------

# Using the official Ubuntu image
FROM ubuntu:24.04 AS base

# Define the metadata
LABEL author="CarrickCanCloud"
LABEL maintainer="CarrickCanCloud"
LABEL homepage="https://carrickcan.cloud"
LABEL license="GPL-3.0"
LABEL description="Apache web server on Ubuntu 24.04."
LABEL version="1.0"
LABEL build-date="2025-11-07"

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and upgrade the base image packages and clean up
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    rm -rf /var/lib/apt/lists/*

# ---------------------
# --- Content stage ---
# ---------------------
    
# Prepare content to seed into other images
FROM scratch AS content
COPY ./apache/images/ /seed/images/

# -----------------
# --- Web stage ---
# -----------------

# Use the base to build the web image
FROM base AS web

# Install Apache and enable necessary modules
RUN apt-get update && \
    apt-get install -y --no-install-recommends apache2 && \
    a2enmod headers && \
    rm -rf /var/lib/apt/lists/*

# Copy Apache configuration files
COPY ./apache/conf/apache.conf /etc/apache2/sites-available/000-default.conf
COPY ./apache/conf/security.conf /etc/apache2/conf-available/security.conf

# Seed the web content
COPY --from=content /seed/images/ /var/www/html/images/

# Entrypoint script
COPY ./shell/apache_start.sh /usr/local/bin/apache_start.sh
RUN chmod +x /usr/local/bin/apache_start.sh

# Expose port 80 for HTTP traffic
EXPOSE 80

# Run the start script
CMD ["/usr/local/bin/apache_start.sh"]

# --------------------
# --- Samba stage ---
# --------------------

# Use the base to build the samba image
FROM base AS samba

# Install Samba and ACL
RUN apt-get update && \
    apt-get install -y --no-install-recommends samba acl && \
    rm -rf /var/lib/apt/lists/*

# Create group and service users
RUN groupadd -r wwwshare && \
    useradd -r -s /usr/sbin/nologin -g wwwshare wwwsvc && \
    useradd -M -s /usr/sbin/nologin -G wwwshare wwwuser

# Prepare share path and permissions
RUN mkdir -p /srv/www/html /var/log/samba && \
    chown -R wwwsvc:wwwshare /srv/www/html && \
    chmod -R 2775 /srv/www/html && \
    setfacl -R -m g:wwwshare:rwx /srv/www/html && \
    setfacl -R -d -m g:wwwshare:rwx /srv/www/html

# Entrypoint script
COPY ./shell/samba_start.sh /usr/local/bin/samba_start.sh
RUN chmod +x /usr/local/bin/samba_start.sh

# Seed content for first-run population of the volume
COPY --from=content /seed /seed

# Copy Samba configuration file
VOLUME ["/srv/www/html", "/var/lib/samba", "/var/cache/samba", "/var/log/samba"]

# Expose Samba port
EXPOSE 445/tcp

# Define healthcheck to ensure Samba is running
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s CMD bash -lc "ss -lnt | grep -q ':445 ' || exit 1"

# Run the start script
CMD ["/usr/local/bin/samba_start.sh"]
