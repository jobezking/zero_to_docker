docker version
docker images
docker pull nginx:latest
docker run --name test -d -p 8080:80 nginx:latest #start a new container named test in detached mode and map port 8080 on the host to port 80 in the container
docker ps #list running containers
docker ps -a #list all containers, including stopped ones
docker exec -it test bash
docker stop test #stop the container named test
docker rm test #remove the container named test