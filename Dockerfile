FROM node:current as webbuild
WORKDIR /app
COPY nodejs-poolController-webClient/package*.json ./
RUN npm install
COPY ./nodejs-poolController-webClient/. .
RUN npm run build:parcel

FROM node:current as controllerbuild
WORKDIR /app
COPY ./nodejs-poolController/package*.json ./
RUN npm install
COPY ./nodejs-poolController/. .
COPY --from=webbuild /app/dist/web/ /app/dist/static/
RUN npm run build-prod

FROM node:current-slim as releasecontainer
COPY --from=controllerbuild /app/dist/compiled /app

ENTRYPOINT ["node", "/app/index.js"]
