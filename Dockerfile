FROM node:13.13.0

RUN npm install gatsby@2.25.4
RUN export PATH=$PWD/node_modules/.bin:$PATH
