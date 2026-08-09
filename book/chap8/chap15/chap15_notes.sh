docker volume create myvol
docker volume ls
sudo ls -l /var/lib/docker/volumes
sudo ls -l /var/lib/docker/volumes/myvol/_data
docker volume inspect myvol
docker volume prune --all # deletes all unmounted volumes
docker volume rm myvol  # deletes myvol if it is unmounted/unused
docker run -it --name voltainer --mount source=bizvol,target=/vol alpine  #creates container voltainer and volume bizvol and mounts it to /vol in the container
# If you specify a volume that already exists, Docker will use it. If you specify a volume that does not exist, Docker will create it
#Previous command takes you to container shell. CRTL + P + Q to exit the container shell and return to host shell.

docker exec -it voltainer sh
echo "I promise to write a book review on Amazon" > /vol/file1
cat /vol/file1
exit
docker rm voltainer -f
docker ps -a
docker volume ls

#SAMBA/CIFS

docker volume create \
  --driver local \
  --opt type=cifs \
  --opt device=//192.168.1.50/my-share \
  --opt o=username=myuser,password=mypassword,file_mode=0777,dir_mode=0777 \
  my_samba_volume