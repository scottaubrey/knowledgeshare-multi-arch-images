# Multi-arch image building knowledge share

Slides are [here](slides.pdf)

## Explore multiarch images

```shell
> docker manifest inspect ubuntu:20.04
> docker manifest inspect ubuntu@<copied manifest hash for amd64>
> docker manifest inspect ubuntu@<copied manifest hash for arm64>
> docker pull ubuntu:20.04
> docker image inspect ubuntu:20.04 # ID matches your native architecture image ID
> docker pull --platform linux/amd64 ubuntu:20.04
> docker image inspect ubuntu:20.04 # ID matches amd64 image
> docker pull --platform linux/arm64 ubuntu:20.04
> docker image inspect ubuntu:20.04 # ID matches arm64 image
> docker image rm ubuntu:20.04
```

## Build multiarch images

Review the simple instructions in `Dockerfile`. We're just building a ubuntu image that prints the contents of `test.txt`.

### "standard" Docker build

Make sure to replace `scottaubrey` with your own dockerhub repo.

```shell
docker build . -t scottaubrey/test-multiarch-image:standard-build
docker run scottaubrey/test-multiarch-image:standard-build
docker push scottaubrey/test-multiarch-image:standard-build
```

### single arch Docker buildx

```shell
docker buildx build . -t scottaubrey/test-multiarch-image:buildx-single-arch --load
docker run scottaubrey/test-multiarch-image:buildx-single-arch
docker push scottaubrey/test-multiarch-image:buildx-single-arch
```

### multi-arch Docker buildx

```shell
docker buildx build . -t scottaubrey/test-multiarch-image:buildx-multi-arch --push
docker run scottaubrey/test-multiarch-image:buildx-multi-arch
```
