docker version
docker images
docker pull nginx:latest
docker run --name test -d -p 8080:80 nginx:latest #start a new container named test in detached mode and map port 8080 on the host to port 80 in the container
docker ps #list running containers
docker ps -a #list all containers, including stopped ones
docker exec -it test bash
docker stop test #stop the container named test
docker rm test #remove the container named test
docker build -t test:latest . # build a new image named test:latest from the Dockerfile in the current directory
docker run -d --name web1 --publish 8080:8080 test:latest # start a new container named web1 in detached mode and map port 8080 on the host to port 8080 in the container
docker rm web1 -f # force remove the container named web1
docker rmi test:latest # remove the image named test:latest