# See all supported node tags:
# https://hub.docker.com/_/node
FROM node:22-bookworm-slim

RUN npm install -g @angular/cli@~19.2

WORKDIR /

RUN mkdir angular-app

WORKDIR /angular-app
