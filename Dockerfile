#FROM debian:wheezy
FROM debian

RUN apt-get -y update
RUN apt-get -y install openjdk-8-jre-headless wget

# 1.14.4
RUN wget -q https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar

WORKDIR /data
VOLUME /data

EXPOSE 25565

CMD echo eula=true > /data/eula.txt && java -jar /server.jar
