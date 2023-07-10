FROM node:18

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
