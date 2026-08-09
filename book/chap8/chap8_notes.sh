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
docker inspect ddd-book:ch8.node

Push image to registry (optional)
docker login # credentials are stored in '/home/user/.docker/config.json'
docker tag ddd-book:ch8.node <username>/ddd-book:ch8.node
docker push <username>/ddd-book:ch8.node
docker run -d --name c1 -p 5005:8080 <username>/ddd-book:ch8.node
docker ps
cd ../multi-stage
docker build -t multi:full .

docker build -t multi:client --target prod-client -f Dockerfile-final .
docker build -t multi:server --target prod-server -f Dockerfile-final .
docker images
cd ../node-app
docker build -t ddd-book:ch8.npm  -f Dockerfile-npm .

# docker build containerizes applications. It reads a Dockerfile and follows the instructions to create an OCI image. 
# The -t flag tags the image, and the -f flag lets you specify the name and location of the Dockerfile. 
# The build context is where your application files exist and can be a directory on your local Docker host or a remote Git repo. 
# The Dockerfile FROM instruction specifies the base image. It’s usually the first instruction in a Dockerfile, and it’s considered a good practice
# to build from Docker Official Images or images from Verified Publishers. 
# FROM is also used to identify new build stages in multi-stage builds. The Dockerfile RUN instruction lets you run commands during a build. 
# It’s commonly used to update packages and install dependencies. Every RUN instruction creates a new image layer. 
# The Dockerfile COPY instruction adds files to images, and you’ll regularly use it to copy your application code into a new image. 
# Every COPY instruction creates an image layer. The Dockerfile EXPOSE instruction documents an application’s network port. 
#The Dockerfile ENTRYPOINT and CMD instructions tell Docker how to run the app when starting a new container. 
# Some other Dockerfile instructions include LABEL, ENV, ONBUILD, HEALTHCHECK and more.