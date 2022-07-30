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

ironfish accounts:import --config=./config.json
Enter the account name: juniormayhe
Enter the account spending key: d74d84797b21b0874b492d579ac263638ea6cd5614b501599b3a71d13e0cada6
Enter the account incoming view key: c7a6425ed612afb246586dc81dc59c6a799ef3039cb4bfdb3022499fc8d22d05
Enter the account outgoing view key: ed7283cb657cb75a13ef08b06615bcc727c1dc4c6fdab89d28a7e11e9974a076
Enter the account public address: 3216c44e3c433b0a981e8f5d167579f90ec6e2156b02300fe5379b15259523344d019d8ea16b81ed5089a8

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
