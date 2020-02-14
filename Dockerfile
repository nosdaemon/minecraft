FROM debian

RUN apt-get -y update
#RUN apt-get -y install -t jessie-backports  openjdk-8-jre-headless ca-certificates-java
RUN apt-get -y install openjdk-11-jdk-headless wget

# 1.15.2
RUN wget -q https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar

WORKDIR /data
VOLUME /data

EXPOSE 25565

CMD echo eula=true > /data/eula.txt && java -Xmx4G -Xms4G -XX:ParallelGCThreads=2 -XX:+AggressiveOpts -jar /server.jar
