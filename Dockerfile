FROM debian:latest

# Install packages
RUN apt update && apt install -y \
    curl \
    gnupg \
    wget

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
 && apt-get install -y nodejs

# Clean up run image
RUN apt remove -y \
    curl \
 && apt-get purge -y --auto-remove \
                  -o APT::AutoRemove::RecommendsImportant=false \
 && rm -rf /var/lib/apt/lists/* \
           /tmp/*

# Install app
WORKDIR /root/app
COPY ["data", "/root/app/data"]
COPY ["*.js", "/root/app/"]
COPY ["*.json", "/root/app/"]
RUN npm install

# Setup working volume
VOLUME "/working"

# Set up entrypoint
WORKDIR /root/app
COPY ["entrypoint.sh", "/root/app/"]
RUN chmod +x entrypoint.sh
ENTRYPOINT ./entrypoint.sh
