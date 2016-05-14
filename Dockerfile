FROM ruby:2.3.1
MAINTAINER paul@phallguy.com

# Install the latest version of packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y htop git software-properties-common && \
    gem install bundler --wrappers --bindir /usr/local/bin

ADD gosu /usr/local/sbin/gosu
RUN chmod a+x /usr/local/sbin/gosu