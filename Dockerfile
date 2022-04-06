FROM node:16.14.2

WORKDIR /app

COPY package.json /app
COPY package-lock.json /app

RUN npm install --production

CMD [ "node", "app.js" ]
