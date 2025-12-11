FROM registry.access.redhat.com/ubi10/nodejs-22@sha256:11a7e442c26772f6c0e90f8a32b5c15d08686fd41a371ed92759ca4d19c66cf2

WORKDIR /app
RUN chown -R 1001:1001 /app

COPY package.json ./
COPY yarn.lock ./

RUN npm install -g yarn

RUN yarn install

COPY app.js ./

EXPOSE 3000

CMD ["yarn", "start"]