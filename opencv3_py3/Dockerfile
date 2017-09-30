FROM ubuntu:16.04

# Step 1: Update packages
RUN apt-get -y update

# Step 2: Install OS libraries

# Step 2.1: Remove any previous installations of x264
RUN apt-get -y remove x264 libx264-dev

# Step 2.2: Install dependencies
RUN apt-get -y install build-essential checkinstall cmake pkg-config yasm gfortran git \
    libjpeg8-dev libjasper-dev libpng12-dev \
    libtiff5-dev \
    libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev \
    libxine2-dev libv4l-dev \
    libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev \
    libqt4-dev libgtk2.0-dev libtbb-dev \
    libatlas-base-dev \
    libfaac-dev libmp3lame-dev libtheora-dev \
    libvorbis-dev libxvidcore-dev \
    libopencore-amrnb-dev libopencore-amrwb-dev \
    x264 v4l-utils 

# Step 2.3: Optional dependencies
RUN apt-get -y install libprotobuf-dev protobuf-compiler \
libgoogle-glog-dev libgflags-dev \
libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

# Step 3: Install Python libraries
RUN apt-get -y install python3-dev python3-pip
RUN pip3 install -U pip
RUN pip3 install numpy scipy matplotlib scikit-image scikit-learn ipython

# Step 4: Download OpenCV and OpenCV_contrib
WORKDIR /
RUN apt-get -y install wget unzip

# Step 4.1: Download opencv from Github
RUN wget https://github.com/Itseez/opencv/archive/3.3.0.zip -O opencv3.zip && \
    unzip -q opencv3.zip && mv /opencv-3.3.0 /opencv 

# Step 4.2: Download opencv_contrib from Github
RUN  wget https://github.com/Itseez/opencv_contrib/archive/3.3.0.zip -O \
    opencv_contrib3.zip && \
    unzip -q opencv_contrib3.zip && mv /opencv_contrib-3.3.0 /opencv_contrib

# Step 5: Compile and install OpenCV with contrib modules

# Step 5.1: Create a build directory inside OpenCV directory
RUN mkdir /opencv/build
WORKDIR /opencv/build

# Step 5.2: Run CMake
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON ..

# Step 5.3: Compile and Install
RUN make -j8
RUN make install
RUN sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
RUN ldconfig

# Cleanup to reduce the size of image
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf ~/.cache/pip

# Settingup ipython notebook
RUN pip --no-cache-dir install \
        ipykernel \
        jupyter

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