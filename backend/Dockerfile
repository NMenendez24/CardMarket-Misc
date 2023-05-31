FROM node:18-alpine3.16

COPY . /app

WORKDIR /app
COPY package*.json ./
RUN npm install

EXPOSE 3000