// routes/searchJobs.js
const express = require('express');
const router = express.Router();
const pool = require('../db');

router.post('/', async (req, res) => {
  const { talent_id, user_id } = req.body; // Optional parameters from request body

  try {
    const result = await pool.query(
      'SELECT * FROM search_jobs_by_talent($1, $2)',
      [talent_id || null, user_id || null]
    );
    res.json(result.rows);
  } catch (err) {
    console.error('Error executing search_jobs_by_talent:', err);
    res.status(500).json({ error: 'Database query failed' });
  }
});

module.exports = router;
