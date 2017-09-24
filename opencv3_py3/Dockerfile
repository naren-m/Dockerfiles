# narenm/py3 is based on ubuntu:16.04
# Dockerfilese - https://github.com/naren-m/Dockerfiles
FROM narenm/py3
MAINTAINER Naren Mudivarthy <narenuday595@gmail.com>

RUN apt-get -y update

# Install Utils
# Install developer tools used to compile OpenCV 3.0
# Install packages used to process video streams and access frames from cameras
# The highgui  module relies on the GTK library, which you should install using the following command
# install libraries that are used to optimize various functionalities inside OpenCV, such as matrix operations

# Installing prerequisites
# Compilers
RUN apt-get -y install build-essential

# Required
RUN apt-get -y install cmake libgtk2.0-dev pkg-config libavcodec-dev \
    libavformat-dev libswscale-dev

# Recommended optional packages
RUN apt-get -y install libtbb2 libtbb-dev libjpeg-dev \
    libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
RUN apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
RUN apt-get -y install libxvidcore-dev libx264-dev
RUN apt-get -y install libgtk-3-dev
RUN apt-get -y install libatlas-base-dev gfortran
RUN apt-get -y install wget zip unzip

# Install opencv
RUN wget https://github.com/Itseez/opencv/archive/3.3.0.zip -O opencv3.zip && \
    unzip -q opencv3.zip && mv /opencv-3.3.0 /opencv && \
    wget https://github.com/Itseez/opencv_contrib/archive/3.3.0.zip -O \
    opencv_contrib3.zip && \
    unzip -q opencv_contrib3.zip && mv /opencv_contrib-3.3.0 /opencv_contrib

RUN mkdir /opencv/build
WORKDIR /opencv/build

RUN cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D ENABLE_PRECOMPILED_HEADERS=OFF \
    -D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib/modules \
    -D PYTHON_EXECUTABLE=/usr/bin/python3 \
    -D BUILD_EXAMPLES=ON ..

RUN make -j8 
RUN make install 
RUN ldconfig

# RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
# RUN python get-pip.py && rm get-pip.py && rm -rf ~/.cache/pip/
# RUN pip install --upgrade setuptools pip

RUN pip3  install matplotlib 
# scipy 
#sklearn        pandas

# IPython
# EXPOSE 8888

WORKDIR /code
