FROM kalilinux/kali-rolling

LABEL org.label-schema.name="Brute - Kali Linux" \
      org.label-schema.description="Automatically brute force all services running on a target." \
      org.label-schema.usage="https://github.com/Dandelion-18/brute" \
      org.label-schema.url="https://github.com/Dandelion-18/brute" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.docker.cmd.devel="docker run --rm -ti dandelion/brute" \
      maintainer="@dandelion"

RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && \
    echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list

ENV DEBIAN_FRONTEND=noninteractive

RUN set -x && \
    apt-get -yqq update && \
    apt-get -yqq dist-upgrade && \
    apt-get clean

RUN apt-get --yes install git && \
    cd /tmp && \
    git clone https://github.com/Dandelion-18/brute.git && \
    cd brute && \
    ./install.sh && \
    brute

CMD ["brute"]
