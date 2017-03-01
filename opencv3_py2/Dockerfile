# narenm/dev-env is based on ubuntu:16.04
# Git location of dev-env
#   - https://github.com/naren-m/Dockerfiles/tree/master/dev-env
FROM narenm/dev-env
MAINTAINER Naren Mudivarthy <narenuday595@gmail.com>

ENV PYTHON_VERSION 2.7
ENV NUM_CORES 4

# Install OpenCV 3.1.0
RUN apt-get -y update
RUN apt-get -y install python$PYTHON_VERSION-dev wget unzip \
               build-essential cmake git pkg-config libatlas-base-dev \
               gfortran \
               libjasper-dev libgtk2.0-dev libavcodec-dev libavformat-dev \
               libswscale-dev libjpeg-dev libpng-dev libtiff-dev \
               libjasper-dev libv4l-dev

RUN wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py && rm get-pip.py

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

