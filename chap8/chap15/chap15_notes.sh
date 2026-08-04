docker volume create myvol
docker volume ls
sudo ls -l /var/lib/docker/volumes
sudo ls -l /var/lib/docker/volumes/myvol/_data
docker volume inspect myvol