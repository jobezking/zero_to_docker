docker run imagename [override command] [args]  # containers have a default command, but you can override it with your own command and arguments
docker run nginx ls -l /usr/share/nginx/html  # run the nginx image and list the contents of the default web directory
docker ps --all  # list all containers, including stopped ones
docker run = docker create + docker start  # run is a combination of create and start, it creates a new container and starts it immediately
docker create imagename  # create a new container from the specified image, but do not start it
docker start container_id  # start a stopped container using its ID or name
docker system prune  # remove all stopped containers, unused networks, dangling images, and build cache
docker logs container_id  # view the logs of a running or stopped container
docker stop container_id  # stop a running container using its ID or name
docker kill container_id  # forcefully stop a running container using its ID or name

## Example
docker run -d redis  # run the redis image in detached mode (in the background)
docker ps  # get container ID of the running redis container
docker run -it --name my-redis redis sh # run the redis image in interactive mode with a custom name
docker exec -it container_id redis-cli  # open an interactive redis-cli shell inside the running container
docker exec -it container_id bash  # open an interactive bash shell inside the running container

# Needs to be in directory with valid Dockerfile
docker build .    # note "Successfully built <image_id>" at the end of the output
docker run -d <image_id>  # run the newly built image in detached mode

docker build . -t app1
docer run -d app1  # run the newly built image in detached mode

docker build -f Dockerfile.dev . -t app1  # build an image using a specific Dockerfile (Dockerfile.dev) and tag it as app1