FROM debian

RUN apt-get -y update
#RUN apt-get -y install -t jessie-backports  openjdk-8-jre-headless ca-certificates-java
RUN apt-get -y install openjdk-8-jdk-headless wget
RUN apt-get -y install openjdk-8-jdk-headless wget

# 1.16.3
RUN wget -q https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar


WORKDIR /data
VOLUME /data

EXPOSE 25565

CMD echo eula=true > /data/eula.txt && java -Xmx4G -Xms4G -XX:ParallelGCThreads=2 -XX:+AggressiveOpts -jar /server.jar
