FROM ubuntu:16.04

# Install packages
RUN \
  apt-get update && \
  apt-get -y upgrade iputils-ping ssh&& \
  apt-get install -y  && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y git zsh exuberant-ctags && \
  add-apt-repository ppa:jonathonf/vim && \
  apt-get update && \
  apt-get install -y vim && \
  cd /root && git clone https://github.com/naren-m/dotfiles.git && \
  cd dotfiles &&\
  ./bootstrap.sh -f


