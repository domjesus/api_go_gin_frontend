FROM node:16-alpine as base

WORKDIR /src
COPY package*.json /
EXPOSE 8080

FROM base as production
ENV NODE_ENV=production
RUN npm ci
COPY . /
CMD ["node", "bin/www"]

FROM base as dev
ENV NODE_ENV=development
RUN npm install
COPY . /
# CMD ["nodemon", "bin/www"]