FROM debian

RUN apt-get -y update
#RUN apt-get -y install -t jessie-backports  openjdk-8-jre-headless ca-certificates-java
RUN apt-get -y install openjdk-11-jdk-headless wget

# 1.16.3
RUN wget -q https://launcher.mojang.com/v1/objects/f02f4473dbf152c23d7d484952121db0b36698cb/server.jar


WORKDIR /data
VOLUME /data

EXPOSE 25565

CMD echo eula=true > /data/eula.txt && java -Xmx4G -Xms4G -XX:ParallelGCThreads=2 -XX:+AggressiveOpts -jar /server.jar
