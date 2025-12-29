const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");

require("dotenv").config();

const server = express();

server.use(cors());
server.use(express.json({ limit: "25Mb" }));

const port = 3000;
server.listen(port, () => {
  console.log(
    `Commander Shepard! Calibrations are done!: <httplicalhost:${port}`
  );
});

async function getConnection() {
  const connection = await mysql.createConnection({
    host: process.env.MYSQL_HOST,
    port: process.env.MYSQL_PORT,
    database: process.env.MYSQL_NAME,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
  });
  return connection;
}

server.get("/", (req, res) => {
  res.send("Ok!");
});

// get funcionando
server.get("/api/characters", async (req, res) => {
  const connection = await getConnection();
  const [rows] = await connection.query(`SELECT * FROM characters`);
  res.json(rows);
});

// post funcionando
server.post("/api/characters", async (req, res) => {
  try {
    const connection = await getConnection();

    const {
      name,
      age,
      description,
      background,
      skills,
      relationship,
      occupation_id,
    } = req.body;

    const sql = `
      INSERT INTO characters
      (name, age, description, background, skills, relationship, occupation_id)
      VALUES (?, ?, ?, ?, ?, ?, ?)
    `;

    const values = [
      name,
      age,
      description,
      background,
      skills,
      relationship,
      occupation_id,
    ];

    const [result] = await connection.query(sql, values);

    res.json({
      success: true,
      id: result.insertId,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      success: false,
      error: error.message,
    });
  }
});

// put funcionando
server.put("/api/characters/:id", async (req, res) => {
  const connection = await getConnection();
  const { id } = req.params;

  const {
    name,
    age,
    description,
    background,
    skills,
    relationship,
    occupation_id,
  } = req.body;

  await connection.query(
    `UPDATE characters
      SET name = ?, age = ?, description = ?, background = ?, skills = ?, relationship = ?, occupation_id = ?
        WHERE id = ?`,
    [
      name,
      age,
      description,
      background,
      skills,
      relationship,
      occupation_id,
      id,
    ]
  );
  res.json({
    success: true,
  });
});

//cambiar
server.delete("/api/characters/:id", async (req, res) => {
  const connection = await getConnection();
  const { id } = req.params;

  const [result] = await connection.query(
    "DELETE FROM characters WHERE id = ?",
    [id]
  );

  if (result.affectedRows === 0) {
    res.status(404).json({
      success: false,
      message: "Character not found",
    });
  } else {
    res.json({ success: true });
  }
});
