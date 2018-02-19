FROM node:6

ARG DATATOOLS_API_URL=http://localhost:4000/api
ENV DATATOOLS_API_URL=$DATATOOLS_API_URL

RUN npm i -g serve

#RUN git clone https://github.com/conveyal/datatools-ui.git /opt/datatools-ui # Old, deprecated
RUN git clone https://github.com/catalogueglobal/datatools-ui.git /opt/datatools-ui

WORKDIR /opt/datatools-ui

ADD ./config /config

COPY /config/env.yml /opt/datatools-ui/configurations/default/env.yml
COPY /config/settings.yml /opt/datatools-ui/configurations/default/settings.yml

RUN yarn

RUN yarn build

EXPOSE 9966


CMD serve -p 9966
