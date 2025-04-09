#!/bin/bash

# Set up Node version if using nvm (optional if already set)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Go to project
cd ~/projects/scoutjar/scoutjar-server

# Install dependencies if needed
npm install

# Stop any existing scoutjar-server process
pm2 delete scoutjar-server || true

# Start new scoutjar-server
pm2 start npm --name "scoutjar-server" -- run start:dev

# Save the pm2 process list
pm2 save
