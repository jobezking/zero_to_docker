5 steps to containerize an app
1. Write the app and create dependencies list
2. Create Dockerfile that tells Docker how to build and run the app
3. Build app into image
4. Push image to registry (optional)
5. Run container from image

Example (docker init requires Docker Desktop)
can also use docker init [platform] i.e. docker init python
git clone https://github.com/nigelpoulton/ddd-book.git
cd ddd-book/node-app
docker init  # creates Dockerfile
cd chap8/node-app
docker build -t ddd-book:ch8.node .