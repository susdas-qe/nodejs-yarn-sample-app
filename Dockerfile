FROM docker.io/node:22

WORKDIR /app

COPY package.json ./
COPY yarn.lock ./

RUN yarn install

COPY app.js ./

EXPOSE 3000

CMD ["yarn", "start"]
