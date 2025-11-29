FROM alpine:latest

# Install nginx and bash (for convenience)
RUN apk add --no-cache nginx bash

# Remove default nginx html content
RUN rm -rf /usr/share/nginx/html/*

# Copy your static website files into nginx's document root
COPY webroot_ro /usr/share/nginx/html

# Set ownership to nginx user and group
RUN chown -R nginx:nginx /usr/share/nginx/html

# Set directory permissions (read and execute for directories)
RUN find /usr/share/nginx/html -type d -exec chmod 755 {} \;

# Set file permissions (read for files)
RUN find /usr/share/nginx/html -type f -exec chmod 644 {} \;


# Copy custom nginx config with logging enabled
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Run nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
