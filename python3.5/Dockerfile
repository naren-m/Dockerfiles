FROM narenm/dev-env
MAINTAINER Naren Mudivarthy <narenuday595@gmail.com>

ENV GPG_KEY 0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D
ENV PYTHON_VERSION 3.6


# runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
#    && add-apt-repository ppa:jonathonf/python-3.6 \
    && add-apt-repository ppa:fkrull/deadsnakes \
    && apt-get update \
    && apt-get install -y python3.6 \
	&& rm -rf /var/lib/apt/lists/*



# make some useful symlinks that are expected to exist
RUN cd /usr/bin \
	&& ln -s idle3 idle \
	&& ln -s pydoc3 pydoc \
	&& ln -s python3 python \
	&& ln -s python3-config python-config

CMD ["python3"]