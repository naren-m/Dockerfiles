# narenm/dev-env is based on ubuntu:16.04
# Git location of dev-env
#   - https://github.com/naren-m/Dockerfiles/tree/master/dev-env
FROM narenm/deeplearning
MAINTAINER Naren Mudivarthy <narenuday595@gmail.com>

RUN apt-get update \
	&& apt-get install -y apache2 \
	php libapache2-mod-php php-mcrypt php-mysql
# php libapache2-mod-php php-mcrypt php-mysql

RUN service apache2 start