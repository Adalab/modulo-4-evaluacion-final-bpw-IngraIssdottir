const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');

require('dotenv').config();

const server = express();

server.use(cors());
server.use(express.json({ limit: '25Mb' }));

const port = 3000;
server.listen(port, () => {
    console.log(`Commander Shepard! Calibrations are done!: <httplicalhost:${port}`)
})