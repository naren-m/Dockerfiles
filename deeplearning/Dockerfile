# narenm/dev-env is based on ubuntu:16.04
# Git location of dev-env
#   - https://github.com/naren-m/Dockerfiles/tree/master/dev-env
FROM narenm/dev-env
MAINTAINER Naren Mudivarthy <narenuday595@gmail.com>

ENV PYTHON_VERSION 2.7
ENV NUM_CORES 4

# Pick up some TF dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        python \
        python$PYTHON_VERSION-dev \
        rsync \
        software-properties-common \
        unzip \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py


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
    python -m ipykernel.kernelspec

# Install OpenCV 3.1.0
RUN apt-get -y update
RUN apt-get -y install  wget unzip \
               build-essential \
               cmake \
               pkg-config \
               libatlas-base-dev \
               gfortran \
               libjasper-dev \
               libgtk2.0-dev \
               libavcodec-dev \
               libavformat-dev \
               libswscale-dev \
               libjpeg-dev \
               libpng-dev \
               libtiff-dev \
               libjasper-dev \
               libv4l-dev

RUN wget https://github.com/Itseez/opencv/archive/3.1.0.zip -O opencv3.zip && \
    unzip -q opencv3.zip && mv /opencv-3.1.0 /opencv

RUN wget https://github.com/Itseez/opencv_contrib/archive/3.1.0.zip -O \
    opencv_contrib3.zip && \
    unzip -q opencv_contrib3.zip && mv /opencv_contrib-3.1.0 /opencv_contrib

RUN mkdir /opencv/build
WORKDIR /opencv/build

RUN cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D BUILD_PYTHON_SUPPORT=ON \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_C_EXAMPLES=OFF \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib/modules \
	-D BUILD_EXAMPLES=ON \
	-D BUILD_NEW_PYTHON_SUPPORT=ON \
	-D WITH_IPP=OFF \
	-D WITH_V4L=ON ..

RUN make -j$NUM_CORES
RUN make install
RUN ldconfig

# Install TensorFlow CPU version from central repo
RUN pip install --no-cache-dir --upgrade tensorflow

# RUN ln -s /usr/bin/python3 /usr/bin/python#

# Set up our notebook config.
COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
COPY run_jupyter.sh /

RUN chmod +x /run_jupyter.sh

# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

# Copy sample notebooks.
COPY tf_tutorials /tf_workspace/tf_tutorials

WORKDIR "/tf_workspace"
