ARG NODE_VERSION=8

FROM node:$NODE_VERSION

LABEL authors="cris barbero <cfbarbero@gmail.com>"

# credits to https://github.com/emmenko/docker-nodejs-karma 

RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update && apt-get install -y  google-chrome-stable \

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# We need to install angular CLI globally so that we can use it in our build scripts
RUN npm install -g @angular/cli@~1.1.1
