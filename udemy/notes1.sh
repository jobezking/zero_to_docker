docker run imagename [override command] [args]  # containers have a default command, but you can override it with your own command and arguments
docker run nginx ls -l /usr/share/nginx/html  # run the nginx image and list the contents of the default web directory
docker ps --all  # list all containers, including stopped ones