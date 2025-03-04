// db.js
require('dotenv').config();
const { Pool } = require('pg');

const pool = new Pool({
  user: process.env.DB_USER,       // e.g., 'postgres'
  host: process.env.DB_HOST,       // e.g., 'localhost'
  database: process.env.DB_NAME,   // e.g., 'postgres'
  password: process.env.DB_PASSWORD, // e.g., 'postgres'
  port: process.env.DB_PORT,       // e.g., 5432
});

module.exports = pool;
