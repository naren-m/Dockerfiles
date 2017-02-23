## Deeplearning Docker

Adopted from [tensorflow docker](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/tools/docker)


Building docker
```
docker build -t deeplearning-docker .
```

Starting docker
```
docker run -it -p 8888:8888 -p 6006:6006 --name=deeplearning-docker deeplearning-docker

or

cd deeplearning-docker
./start_docker.sh
```



TODO

[ ] Install Opencv

[ ] Get some Tensorflow tutorials