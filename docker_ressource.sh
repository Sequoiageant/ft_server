# Generate a new image in .
docker build -t ft_server .

# Create a container with a Dockerfile
#	Need to build a new image before
docker run --name test --rm -ti -p 8080:80 ft_server
docker run --name test --rm -ti -p 8080:80 -v $(pwd)/srcs/wordpress:/var/www/wordpress ft_server
docker run --name test --rm -ti -p 8080:80 -p 8081:81 -p 443:443 -v $(pwd)/srcs/wordpress:/var/www/wordpress ft_server
---------

# cree  un conteneur nginx et map le port de sortie
docker run --name nginx-ju --rm -d -p 8080:80 nginx

# ferme un conteneur
dockerr stop [containers]

# Show all the containers
docker ps -a

# Execute bash into the containers
docker exec -ti ft_server bash

# Create a container debian 10 (Buster)
docker run --rm -ti debian:buster

# Create a new image with changes made in source image
docker commit [commit nbr] [name of new image]

# RM an image
docker image rm [name OR Id of image]

# Lanch a container with bash
docker exec -it <container name> /bin/bash

# Delete <none> images
docker rmi $(docker images -f "dangling=true" -q)
