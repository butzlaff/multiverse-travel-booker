FROM ubuntu:22.04

ENV TZ=America/Sao_Paulo

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata curl git libssl-dev libxml2-dev libyaml-dev libgmp-dev libz-dev postgresql \
    && curl -fsSL https://crystal-lang.org/install.sh | bash

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /app

COPY . .

RUN shards install

COPY . .