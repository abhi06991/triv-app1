# Use an outdated base image
FROM ubuntu:18.04

# Install potentially vulnerable packages (latest versions available for Ubuntu 18.04)
RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    openssl \
    libssl-dev \
    apache2

# Add a user with root privileges (potential security risk)
RUN useradd -ms /bin/bash admin && echo "admin:password" | chpasswd && adduser admin sudo

# Expose an unnecessary port (potential security risk)
EXPOSE 8080

# Run the apache service (insecure configuration)
CMD ["apachectl", "-D", "FOREGROUND"]
