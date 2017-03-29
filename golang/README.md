# GoLang Dockerfile

Mounted on [narenm/dev-env](https://github.com/naren-m/Dockerfiles/tree/master/dev-env)

Golang version 1.7.5


## Building docker

```shell
cd golang
docker build -t narenm/golang .
```

## Running GoLang docker

```shell
docker run -it narenm/golang

or

docker run -it narenm/golang bash

or

docker run -it narenm/golang zsh
```