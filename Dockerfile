ARG NODE_VERSION=8

FROM node:$NODE_VERSION

LABEL authors="cris barbero <cfbarbero@gmail.com>"

# credits to https://github.com/emmenko/docker-nodejs-karma 

RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update && apt-get install -y Xvfb google-chrome-stable \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install ngcli
ARG NG_CLI_VERSION=latest
ENV NG_CLI_VERSION=$NG_CLI_VERSION
RUN yarn global add @angular/cli@$NG_CLI_VERSION && rm -rf $(yarn cache dir)

ENV XVFB_DIMENSIONS = "1920x1080x24"
ADD xvfb.sh /etc/init.d/xvfb
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /etc/init.d/xvfb \
    && chmod +x /entrypoint.sh

ENV DISPLAY :99.0
ENV CHROME_BIN /usr/bin/google-chrome

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENTRYPOINT ["/entrypoint.sh"]