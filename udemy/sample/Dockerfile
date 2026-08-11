# Create nginx image with a custom index.html file
FROM ubuntu:latest

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Combine update, install, and cleanup to keep the image small
RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Document that the container listens on port 80
EXPOSE 80

COPY index.html /var/www/html/index.html

CMD ["nginx", "-g", "daemon off;"]

#docker build -t my-nginx-ubuntu .
#docker run -d -p 8888:80 --name my-nginx-container my-nginx-ubuntu
#http://localhost:8888