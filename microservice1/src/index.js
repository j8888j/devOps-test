const express = require('express');

const dotenv = require('dotenv');
dotenv.config();

const app = express();

app.use(express.json());

app.get('/', (_, res) => {
  res.send('Node.js App (microservice 1)');
});

const port = process.env.PORT;
app.listen(port, () => {
  console.log(`Server is running on ${port} port`);
});
