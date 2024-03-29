FROM debian

RUN apt-get -y update
#RUN apt-get -y install -t jessie-backports  openjdk-8-jre-headless ca-certificates-java
RUN apt-get -y install openjdk-17-jdk-headless wget

# 1.18.2
RUN wget -q -P / https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar
RUN pwd


WORKDIR /data
VOLUME /data

EXPOSE 25565

CMD echo eula=true > /data/eula.txt && java -server -Xmx8192M -Xms512M -XX:+UseG1GC -jar /server.jar nogui
