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