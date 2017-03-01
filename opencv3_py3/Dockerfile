# narenm/dev-env is based on ubuntu:16.04
# Git location of dev-env
#   - https://github.com/naren-m/Dockerfiles/tree/master/dev-env
FROM narenm/dev-env
MAINTAINER Naren Mudivarthy <narenuday595@gmail.com>

# Installing prerequisites
RUN apt-get -y update

# Install Utils
RUN apt-get -y install wget zip unzip

# Install developer tools used to compile OpenCV 3.0
RUN apt-get -y install build-essential cmake pkg-config


# install packages used to process video streams and access frames from cameras
RUN apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
RUN apt-get -y install libxvidcore-dev libx264-dev

# The highgui  module relies on the GTK library, which you should install using the following command
RUN apt-get -y install libgtk-3-dev

# install libraries that are used to optimize various functionalities inside OpenCV, such as matrix operations
RUN apt-get -y install libatlas-base-dev gfortran



# Installing python-3.5.2 and dev binings as OpenCV needs python headers and development files
#RUN apt-get update && apt-get install -y --no-install-recommends \
##    && add-apt-repository ppa:jonathonf/python-3.6 \
#    && add-apt-repository ppa:fkrull/deadsnakes \
#    && apt-get update \
#    && apt-get install -y python3.6 python3.6-dev \
#	&& rm -rf /var/lib/apt/lists/*

#  Python development headers and libraries for Python 3.5
#RUN apt-get -y install python3.5-dev
RUN apt-get -y install python3-dev python3-pip python3-tk python3-lxml python3-six

# Install pip
RUN wget https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py

# delete the cache directory
RUN rm -rf ~/.cache/pip/

# Installing numpy
RUN python3 -m pip install numpy

RUN wget https://github.com/Itseez/opencv/archive/3.1.0.zip -O opencv3.zip && \
    unzip -q opencv3.zip && mv /opencv-3.1.0 /opencv

RUN wget https://github.com/Itseez/opencv_contrib/archive/3.1.0.zip -O \
    opencv_contrib3.zip && \
    unzip -q opencv_contrib3.zip && mv /opencv_contrib-3.1.0 /opencv_contrib

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


RUN make -j4
RUN make install
RUN ldconfig



RUN pip --no-cache-dir install \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        scipy \
        sklearn \
        pandas \
        Pillow \
        && \
    python3 -m ipykernel.kernelspec

# make some useful symlinks that are expected to exist
#RUN cd /usr/bin \
#	&& ln -s idle3 idle \
#	&& ln -s pydoc3 pydoc \
#	&& ln -s python3 python \
#	&& ln -s python3-config python-config


WORKDIR /

# Set up our notebook config.
COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
COPY run_jupyter.sh /

RUN chmod +x /run_jupyter.sh

# IPython
EXPOSE 8888

WORKDIR /code

CMD ["/run_jupyter.sh"]