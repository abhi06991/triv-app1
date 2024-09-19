# Use a vulnerable base image
FROM ubuntu:18.04

# Install outdated and vulnerable packages
RUN apt-get update && \
    apt-get install -y \
    wget=1.19.4-1ubuntu2.3 \
    curl=7.58.0-2ubuntu3.16 \
    openssl=1.1.1-1ubuntu2.1~18.04.20 \
    libssl-dev=1.1.1-1ubuntu2.1~18.04.20 \
    apache2=2.4.29-1ubuntu4.14

# Add a user with root privileges (potential security risk)
RUN useradd -ms /bin/bash admin && echo "admin:password" | chpasswd && adduser admin sudo

# Expose an unnecessary port (potential security risk)
EXPOSE 8080

# Run the apache service (insecure configuration)
CMD ["apachectl", "-D", "FOREGROUND"]
