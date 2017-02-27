## Deeplearning Docker

Adopted from [Tensorflow docker](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/tools/docker)

Image is built from [narenm/dev-env](https://github.com/naren-m/Dockerfiles/tree/master/dev-env)


----

Building docker

```
docker build -t narenm/deeplearning .
```

Starting docker
```
docker run -it -p 8888:8888 -p 6006:6006 --rm --name=deeplearning-docker narenm/deeplearning

or

cd deeplearning-docker
./start_docker.sh
```


##### Reference
1. [Install OpenCV 3.0 and Python 2.7+ on Ubuntu PyImageSearch](http://www.pyimagesearch.com/2015/06/22/install-opencv-3-0-and-python-2-7-on-ubuntu/)
2. [Tensorflow docker](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/tools/docker)

TODO

[ ] Get some Tensorflow tutorials