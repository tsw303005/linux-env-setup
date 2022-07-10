FROM ubuntu:18.04 AS BASE

RUN apt-get update && apt-get -y install sudo

RUN echo "root:docker" | chpasswd

WORKDIR /src

RUN echo "sudoPW=docker" >> $HOME/.env

CMD /bin/bash
