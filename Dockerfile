# Use an official lightweight Debian image
FROM debian:bookworm-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    netcat-openbsd \
    cowsay \
    fortune \
    bash \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy Wisecow scripts into container
COPY wisecow.sh /app/wisecow.sh

# Make script executable
RUN chmod +x /app/wisecow.sh

# Expose port (choose 8080 or any app-specific port)
EXPOSE 8080

# Default command
CMD ["/app/wisecow.sh"]
