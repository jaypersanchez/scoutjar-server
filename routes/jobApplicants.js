const express = require('express');
const router = express.Router();
const pool = require('../db');

// POST /job-applicants endpoint to get job applicants
router.post('/', async (req, res) => {
  try {
    const { recruiter_id } = req.body;
    let result;

    // If recruiter_id is provided, pass it to the function; otherwise, call the function with no parameter.
    if (recruiter_id) {
      result = await pool.query('SELECT * FROM get_job_applicants($1)', [recruiter_id]);
    } else {
      result = await pool.query('SELECT * FROM get_job_applicants()');
    }

    res.json(result.rows);
  } catch (err) {
    console.error('Error fetching job applicants:', err);
    res.status(500).json({ error: 'Server error' });
  }
});

module.exports = router;
