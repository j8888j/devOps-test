const express = require('express');
const { createClient } = require('redis');
const dotenv = require('dotenv');

dotenv.config();

const requestLogger = (req, res, next) => {
  console.log(`Request method: ${req.method}, request URL: ${req.url}`);
  next();
};

const connectToRedis = async () => {
  const { REDIS_HOST, REDIS_PORT } = process.env;
  const client = createClient({
    url: `redis://@${REDIS_HOST}:${REDIS_PORT}`,
  });

  client.on('connect', () => {
    console.log('Connected to Redis');
  });

  client.on('error', (err) => {
    console.log('Redis Client Error', err);
  });

  await client.connect();
};

connectToRedis().then(() => {
  const app = express();

  app.use(express.json());
  app.use(requestLogger);
  
  app.get('/', (_, res) => {
    res.send('Node.js App (microservice 2)');
  });
  
  const port = process.env.PORT;
  app.listen(port, () => {
    console.log('Server is running');
  });
});
