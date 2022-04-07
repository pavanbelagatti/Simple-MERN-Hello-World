FROM node:16-alpine

ENV NODE_ENV production

WORKDIR /app

COPY package.json .
COPY package-lock.json .
COPY server.js .
COPY yarn.lock .
RUN yarn install --production

COPY . .

CMD node server.js
