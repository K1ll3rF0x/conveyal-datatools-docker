FROM node:6

ENV VERSION=v2.0.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends gettext-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN npm i -g serve

RUN git clone -b ${VERSION} https://github.com/catalogueglobal/datatools-ui.git /opt/datatools-ui

WORKDIR /opt/datatools-ui

# Add config directory
ADD ./config/*.yml /config/

RUN yarn

COPY /config/settings-client.yml /opt/datatools-ui/configurations/default/settings.yml

EXPOSE 9966

CMD envsubst < /config/env-client.yml > /opt/datatools-ui/configurations/default/env.yml && \
    $(npm bin)/mastarm build --env production && serve -p 9966
