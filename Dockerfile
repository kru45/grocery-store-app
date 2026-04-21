# --- Stage 1: Build the React Application ---
FROM node:20-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package files first to leverage Docker's caching
COPY src-app/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY src-app/ .

# Build the app (generates the 'build' folder)
RUN npm run build

# --- Stage 2: Serve with Nginx ---
FROM nginx:alpine

# Copy the build output from the 'builder' stage to Nginx's web folder
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
