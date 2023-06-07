FROM node:18-alpine3.16

# RUN mkdir -p /home/hola
COPY . /backend
WORKDIR /backend
RUN npm install
RUN node index.js
RUN node Tester.js

EXPOSE 3000