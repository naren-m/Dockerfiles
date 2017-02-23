FROM narenm/ubuntu-grpc:12
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

# gcc for cgo
RUN apt-get update && apt-get install -y --no-install-recommends \
  g++ \
  gcc \
  libc6-dev \
  make \
  curl \
  pkg-config \
  && rm -rf /var/lib/apt/lists/*

ENV GOLANG_VERSION 1.7.1
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_SHA256 43ad621c9b014cde8db17393dc108378d37bc853aa351a6c74bf6432c1bbd182

RUN curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
 && echo "$GOLANG_DOWNLOAD_SHA256  golang.tar.gz" | sha256sum -c - \
 && tar -C /usr/local -xzf golang.tar.gz \
 && rm golang.tar.gz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH