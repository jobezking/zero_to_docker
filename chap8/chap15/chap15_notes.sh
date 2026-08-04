docker volume create myvol
docker volume ls
sudo ls -l /var/lib/docker/volumes
sudo ls -l /var/lib/docker/volumes/myvol/_data
docker volume inspect myvol
docker volume prune --all # deletes all unmounted volumes
docker volume rm myvol  # deletes myvol if it is unmounted/unused
docker run -it --name voltainer --mount source=bizvol,target=/vol alpine  #creates container voltainer and volume bizvol and mounts it to /vol in the container
# If you specify a volume that already exists, Docker will use it. If you specify a volume that does not exist, Docker will create it