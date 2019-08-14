FROM debian

RUN apt-get -y update
#RUN apt-get -y install -t jessie-backports  openjdk-8-jre-headless ca-certificates-java
RUN apt-get -y install openjdk-11-jdk-headless wget

# 1.14.4
RUN wget -q https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar

WORKDIR /data
VOLUME /data

EXPOSE 25565

CMD echo eula=true > /data/eula.txt && java -Xmx4096M -Xms4096M -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSIncrementalPacing -XX:ParallelGCThreads=2 -XX:+AggressiveOpts -jar /server.jar
