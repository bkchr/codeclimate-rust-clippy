FROM ubuntu
MAINTAINER Bastian Köcher <codeclimate@kchr.de>

ENV DEBIAN_FRONTEND noninteractive

ENV LANG C.UTF-8

RUN \
  apt-get update && \
  apt-get -y install \
          git \
          curl \
          gcc \
          libcurl4-openssl-dev \
          libelf-dev \
          libdw-dev \
          binutils-dev \
          cmake \
          libjson-c-dev \
          libjson-c2 \
          libssl-dev \
          openssl \
          pkg-config \
          wget \
          unzip \
          python \
          libiberty-dev

RUN     mkdir -p /app/.cargo/bin

ADD     ./bin/codeclimate-clippy /app/
ADD     ./bin/cargo-clippy /app/.cargo/bin/

ADD     ./main.sh /app/

RUN     adduser --group -u 9000 --system --home /app app
RUN     chown -R app:app /app

RUN     mkdir -p /code-copy
RUN     chown -R app:app /code-copy

USER    app

ADD     install-rust.sh /app/
RUN     /app/install-rust.sh 
ENV     PATH=/app/.cargo/bin:$PATH

VOLUME  /code
WORKDIR /code

CMD     ["/app/main.sh"]