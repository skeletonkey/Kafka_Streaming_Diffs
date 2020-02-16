FROM perl:5.20
MAINTAINER Erik Tank <erik.tank@ticketmaster.com>

WORKDIR /code

#RUN mvn compile

RUN echo 'alias ll="ls -al"' >> ~/.bashrc;
RUN apt-get update; apt-get -y upgrade; apt-get -y install cpanminus;
RUN cpanm install Net::WebSocket::Server;
RUN cpanm install JSON;

COPY code /code

CMD perl /code/map_server.pl;