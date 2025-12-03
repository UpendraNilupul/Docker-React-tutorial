# Use the base image from Docker Hub
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Copy package metadata and install dependencies first (cache-friendly)
COPY package*.json ./

# Use npm ci for reproducible installs when lockfile present
RUN npm ci --silent

# Copy the rest of the application files
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
