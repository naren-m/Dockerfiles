# Deeplearning Docker

Adopted from [Tensorflow docker](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/tools/docker)

----

## Building docker

```bash
docker build -t narenm/deeplearning:gpu .
```

## Starting docker

```bash
nvidia-docker run -it -p 8888:8888 -p 6006:6006 --rm --name=deeplearning-docker narenm/deeplearning:gpu

or

cd deeplearning-docker
./start_docker.sh
```

## Reference

- [Install OpenCV 3.3.0](https://www.learnopencv.com/install-opencv3-on-ubuntu/)
- [Medium install OpenCV 3.3.0](https://medium.com/@debugvn/installing-opencv-3-3-0-on-ubuntu-16-04-lts-7db376f93961)
- [Install OpenCV 3.0 and Python 2.7+ on Ubuntu](http://www.pyimagesearch.com/2015/06/22/install-opencv-3-0-and-python-2-7-on-ubuntu/)
- [Install OpenCV 3.0 and Python 2.7+ on Ubuntu PyImageSearch](http://www.pyimagesearch.com/2015/06/22/install-opencv-3-0-and-python-2-7-on-ubuntu/)
- [Tensorflow docker](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/tools/docker)