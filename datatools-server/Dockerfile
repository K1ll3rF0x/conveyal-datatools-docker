FROM openjdk:8-jdk

ENV VERSION=v2.0.1

# Install dependencies
RUN apt-get update
RUN apt-get install -y --no-install-recommends maven git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mvn -v

#RUN git clone https://github.com/conveyal/datatools-server.git /opt/datatools-server  #Old, deprecated
RUN git clone -b ${VERSION} https://github.com/catalogueglobal/datatools-server.git /opt/datatools-server

WORKDIR /opt/datatools-server

RUN mvn dependency:go-offline

VOLUME /root/.m2

ADD ./config/*.yml /config/

COPY /config/env-server.yml /opt/datatools-server/configurations/default/env.yml
COPY /config/server.yml /opt/datatools-server/configurations/default/server.yml

RUN mvn package -Dmaven.test.skip=true


EXPOSE 4000

CMD java -jar "target/dt-$(git describe --always).jar"
