FROM kalilinux/kali-rolling

LABEL org.label-schema.name='Brute - Kali Linux' \
      org.label-schema.description='Automatically brute force all services running on a target.' \
      org.label-schema.usage='https://github.com/Dandelion-18/brute' \
      org.label-schema.url='https://github.com/Dandelion-18/brute' \
      org.label-schema.schema-version='1.0' \
      org.label-schema.docker.cmd.devel='docker run --rm -ti dandelion/brute' \
      MAINTAINER="@dandelion"

RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && \
    echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive

RUN set -x \
    && apt-get -yqq update

RUN set -x \
    && apt-get -yqq dist-upgrade

RUN set -x \
    && apt-get clean

RUN set -x \
    && apt-get --yes install git

RUN set -x \
    && cd /tmp \
    && git clone https://github.com/Dandelion-18/brute.git

RUN set -x \
    && cd /tmp/brute \
    && ./install.sh

CMD ["brute"]
