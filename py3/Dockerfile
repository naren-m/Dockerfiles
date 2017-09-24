# narenm/dev-env is based on ubuntu:16.04
# Git location of dev-env
#   - https://github.com/naren-m/Dockerfiles/tree/master/dev-env
FROM narenm/dev-env
MAINTAINER Naren Mudivarthy <narenuday595@gmail.com>

# Installing python-3.6
RUN apt-get update && apt-get install -y --no-install-recommends \
#    && add-apt-repository ppa:jonathonf/python-3.6 \
    && add-apt-repository ppa:fkrull/deadsnakes \
    && apt-get update \
    && apt-get install -y python3.6 python3.6-dev \
	&& rm -rf /var/lib/apt/lists/*

# make some useful symlinks that are expected to exist
RUN cd /usr/bin \
	&& ln -s idle3 idle \
	&& ln -s pydoc3.6 pydoc \
	&& ln -s python3.6 python \
	&& ln -s python3.6-config python-config

WORKDIR /

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py && rm get-pip.py && rm -rf ~/.cache/pip/
RUN pip install --upgrade setuptools pip

RUN pip --no-cache-dir install \
        ipykernel \
        jupyter
    
# Set up our notebook config.
COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
COPY run_jupyter.sh /

RUN chmod +x /run_jupyter.sh