# Docker Image

- Built on [narenm/py3](https://github.com/naren-m/Dockerfiles/tree/master/py3) + OpenCV 3.3.0 and Python


Building docker
```
docker build -t narenm/opencv .
```

Starting docker
```
docker run -it -p 8888:8888 --rm --name=opencv-docker narenm/opencv

or

cd opencv-docker
./start_docker.sh
```

## References
1. [Medium install OpenCV 3.3.0](https://medium.com/@debugvn/installing-opencv-3-3-0-on-ubuntu-16-04-lts-7db376f93961)

2. [Install OpenCV 3.0 and Python 2.7+ on Ubuntu](http://www.pyimagesearch.com/2015/06/22/install-opencv-3-0-and-python-2-7-on-ubuntu/)
