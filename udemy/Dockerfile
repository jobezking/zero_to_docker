# Use an existing Docker image as a base
FROM alpine

# Download and install a dependency
RUN apk add --no-cache --update curl redis

# Tell the image what to do when it starts as a container
CMD ["redis-server"]