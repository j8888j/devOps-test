FROM --platform=linux/amd64 node:alpine

ARG MICROSERVICE_PATH

ENV ENV development
ENV PORT 3000

WORKDIR /usr/app

COPY ${MICROSERVICE_PATH}/package.json .
COPY ${MICROSERVICE_PATH}/package-lock.json .
RUN npm i

COPY ./${MICROSERVICE_PATH}/src ./src

CMD [ "npm", "run", "start:dev"]
