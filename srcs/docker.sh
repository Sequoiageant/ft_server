# Generate a new image in .
docker build -t ft_server . \

# Create a container with a Dockerfile
#	Need to build a new image before
docker run --name test --rm -ti \
	-p 80:80 -p 443:443 \
	-v $(pwd)/srcs/wordpress:/var/www/wordpress ft_server