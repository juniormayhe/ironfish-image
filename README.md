# Docker image

## test the build of local image
build image to test Dockerfile
```
docker build --build-arg NODENAME=juniormayhe --build-arg GRAFFITI=juniormayhe -t my-ironfish ./.
```

run local image
```
docker run -it my-ironfish bash
```

import config from file
```
ironfish accounts:import --config=./config.json
```

## build multi platform image
Install pre requesites https://medium.com/@artur.klauser/building-multi-architecture-docker-images-with-buildx-27d80f7e2408

Login to docker and build
```
$env:DOCKER_USER = "juniormayhe"
docker login -u "$env:DOCKER_USER"
```

build images
```
sudo docker buildx build --build-arg NODENAME=juniormayhe --build-arg GRAFFITI=juniormayhe -t "${DOCKER_USER}/ironfish:latest"   --platform linux/amd64,linux/arm64 --push .
```

## start and import account
```
sudo docker run -it juniormayhe/ironfish bash
```

start ironfish
```
(nohup ironfish start > /dev/null &)
```

import account
```
ironfish accounts:import
ironfish accounts:use juniormayhe
```

check status
```
ironfish status -f
```

You can export your keys to file:
```
ironfish accounts:export <your_acc_name> <path_to_file>
```

And import that after with this command
```
ironfish accounts:import <path_to_file>
```
