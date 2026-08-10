# Build container for simple neural network using TensorFlow and Keras
FROM python:3.8-slim
# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libatlas-base-dev \
    && rm -rf /var/lib/apt/lists/*
# Install TensorFlow and Keras
RUN pip install --no-cache-dir tensorflow keras
# Set the working directory
WORKDIR /app

# Copy the application code into the container
COPY . /app
