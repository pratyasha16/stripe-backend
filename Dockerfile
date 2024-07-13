# FROM node:10-alpine

# RUN mkdir /home/node/app

# RUN mkdir -p ./node_modules && chown -R node:node /home/node/app

# WORKDIR /home/node/app

# COPY package*.json ./

# USER node

# RUN npm install

# COPY --chown=node:node . .

# EXPOSE 4242

# CMD [ "node", "server.js" ]

FROM node:18-alpine
WORKDIR /opt/
COPY package.json ./
RUN npm install
WORKDIR /opt/app
COPY Stripe-backend .

RUN chown -R node:node /opt/app
USER node
EXPOSE 4242
CMD ["node", "server.js"]
