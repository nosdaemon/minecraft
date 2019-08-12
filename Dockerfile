FROM debian:wheezy

RUN apt-get -y update
RUN apt-get -y install openjdk-7-jre-headless wget

RUN wget -q https://s3.amazonaws.com/Minecraft.Download/versions/1.9.2/minecraft_server.1.9.2.jar

WORKDIR /data
VOLUME /data

EXPOSE 25565

CMD echo eula=true > /data/eula.txt && java -jar /minecraft_server.1.9.2.jar
