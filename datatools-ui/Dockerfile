FROM node:6

RUN npm i -g serve

RUN git clone https://github.com/catalogueglobal/datatools-ui.git /opt/datatools-ui

WORKDIR /opt/datatools-ui

# Add config directory
ADD ./config/*.yml /config/

COPY /config/env-client.yml /opt/datatools-ui/configurations/default/env.yml
COPY /config/settings-client.yml /opt/datatools-ui/configurations/default/settings.yml

RUN yarn

RUN yarn build

EXPOSE 9966


CMD serve -p 9966
