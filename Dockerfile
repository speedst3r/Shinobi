FROM ubuntu:xenial
MAINTAINER Moe Alam <shinobi@m03.ca>
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y ffmpeg nodejs npm libav-tools libx264-dev libx265-dev wget curl
RUN ln -s /usr/bin/nodejs /usr/bin/node && mkdir /opt/shinobi
ADD . /opt/shinobi
WORKDIR /opt/shinobi
RUN cp /opt/shinobi/conf.sample.json /opt/shinobi/conf.json
RUN npm install pm2 -g
RUN npm install \
    && chmod +x ./docker-entrypoint.sh
EXPOSE 8080
ENTRYPOINT ./docker-entrypoint.sh