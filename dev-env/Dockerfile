FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

# Install packages

RUN \
  apt-get update && \
  apt-get -y upgrade iputils-ping ssh && \
  apt-get install -y  && \
  apt-get install -y build-essential fontconfig && \
  apt-get install -y software-properties-common && \
  apt-get install -y git zsh exuberant-ctags && \
  add-apt-repository ppa:jonathonf/vim && \
  apt-get update && \
  apt-get install -y vim && \
  touch /root/.aliases_work && \
  cd /root && git clone https://github.com/naren-m/dotfiles.git && \
  cd dotfiles &&\
  ./bootstrap.sh -f

RUN \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# gcc for cgo
RUN apt-get update && apt-get install -y --no-install-recommends \
  g++ \
  gcc \
  libc6-dev \
  make \
  curl \
  pkg-config \
  && rm -rf /var/lib/apt/lists/*

RUN cp /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && \
    dpkg-reconfigure locales && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8

# Powerline fonts
RUN mkdir -p $HOME/.fonts $HOME/.config/fontconfig/conf.d && \
    wget -P $HOME/.fonts                     https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf && \
    wget -P $HOME/.config/fontconfig/conf.d/ https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf && \
    fc-cache -vf $HOME/.fonts/ && \
    echo "set guifont=Droid\\ Sans\\ Mono\\ 10"
