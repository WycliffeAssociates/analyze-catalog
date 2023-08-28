FROM node:18-slim

RUN apt-get update && apt-get install -y wget && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && rm -rf /var/lib/apt/lists/* /tmp/*

# Install packages
WORKDIR /root/app
COPY ["*.json", "./"]
RUN npm ci

# Install app
COPY ["*.js",   "./"]

# Copy data
COPY ["data",   "./data"]

# Setup working volume
VOLUME "/working"

# Set up entrypoint
COPY ["entrypoint.sh", "./"]
RUN chmod +x entrypoint.sh
ENTRYPOINT ./entrypoint.sh
