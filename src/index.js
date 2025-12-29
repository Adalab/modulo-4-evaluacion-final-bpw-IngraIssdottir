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

async function getConnection() {
    const connection = await mysql.createConnection({
        host: process.env.MYSQL_HOST,
        port: process.env.MYSQL_PORT,
        database: process.env.MYSQL_NAME,
        user: process.env.MYSQL_USER,
        password: process.env.MYSQL_PASSWORD
    })
    return connection;
}

server.get('/', (req, res) => {
    res.send('Ok!');
});

server.get('/api/characters', async (req, res) =>{
    const connection = await getConnection();
    const [rows] = await connection.query(
      `SELECT * FROM characters`
    );
    res.json(rows);
});

server.post('/api/characters', async (req, res) =>{
    const connection = await getConnection();
    const [rows] = await connection.query(
      `SELECT * FROM characters`
    );
    res.json(rows);
});

server.put('/api/characters/:id', async (req, res) =>{
    const connection = await getConnection();
    const [rows] = await connection.query(
      `SELECT * FROM characters`
    );
    res.json(rows);
});

server.delete('/api/characters/:id', async (req, res) =>{
    const connection = await getConnection();
    const [rows] = await connection.query(
      `SELECT * FROM characters`
    );
    res.json(rows);
});