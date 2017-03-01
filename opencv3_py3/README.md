# Docker Image 

- Mounted on [narenm/dev-env](https://github.com/naren-m/Dockerfiles/tree/master/dev-env) + OpenCV 3.1.0 and Python


----

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

## PyImageSearch Reference
1. [Install OpenCV 3.0 and Python 2.7+ on Ubuntu](http://www.pyimagesearch.com/2015/06/22/install-opencv-3-0-and-python-2-7-on-ubuntu/)
