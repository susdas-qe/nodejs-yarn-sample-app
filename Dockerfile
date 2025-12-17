FROM registry.access.redhat.com/ubi10/nodejs-22@sha256:11a7e442c26772f6c0e90f8a32b5c15d08686fd41a371ed92759ca4d19c66cf2
#FROM docker.io/node:22

WORKDIR /app
RUN chown -R 1001:1001 /app

COPY --chown=1001:0 yarn-install/ yarn-install/

# Install yarn first
RUN cd yarn-install && npm install --offline && cd -
RUN ln -s yarn-install/node_modules/yarn/bin/yarn /usr/local/bin/yarn
RUN yarn --version

COPY package.json ./
COPY yarn.lock ./

RUN yarn install

COPY app.js ./

EXPOSE 3000

CMD ["yarn", "start"]
