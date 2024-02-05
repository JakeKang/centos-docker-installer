#!/bin/bash

# Ensure the script is executed with root privileges
if [[ "$(id -u)" -ne 0 ]]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Define directory variables
BASEDIR=$(dirname "$0")
ARCH=$(uname -m) # Detect system architecture

# Set RPMDIR based on the architecture
if [[ "$ARCH" == "x86_64" ]]; then
    RPMDIR="$BASEDIR/rpm/x86_64"
elif [[ "$ARCH" == "aarch64" ]]; then
    RPMDIR="$BASEDIR/rpm/arm64"
else
    echo "Unsupported architecture: $ARCH"
    exit 2
fi

# Install Docker and dependencies directly using rpm command
echo "Installing Docker, Docker Compose, and Docker plugins..."
rpm -ivh $RPMDIR/*.rpm --nodeps --force

# Enable and start Docker
systemctl enable docker
systemctl start docker
echo "Docker service has been started."

# Verify Docker installation
DOCKER_VERSION=$(docker -v)
if [[ $? -eq 0 ]]; then
    echo "Docker has been installed successfully."
    echo "Installed Docker version: $DOCKER_VERSION"
else
    echo "There was an issue verifying the Docker installation."
fi

# Verify Docker Compose installation
DOCKER_COMPOSE_VERSION=$(docker compose version)
if [[ $? -eq 0 ]]; then
    echo "Docker Compose has been installed successfully."
    echo "Installed Docker Compose version: $DOCKER_COMPOSE_VERSION"
else
    echo "There was an issue verifying the Docker Compose installation."
fi
