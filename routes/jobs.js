const express = require('express');
const router = express.Router();
const pool = require('../db');

// Endpoint to insert a new job using your insert_job function
router.post('/', async (req, res) => {
  try {
    // Destructure expected fields from the request body.
    const {
      recruiter_id,
      job_title,
      job_description,
      required_skills, // expected to be an array
      experience_level,
      employment_type,
      salary_range, // expected to be an array of two numbers: [min, max]
      work_mode,
      location
    } = req.body;

    // Prepare query to call the function insert_job.
    const query = `
      SELECT insert_job(
        $1, $2, $3, $4, $5, $6, $7, $8, $9
      ) AS job_id;
    `;
    const values = [
      recruiter_id,
      job_title,
      job_description,
      required_skills,
      experience_level,
      employment_type,
      salary_range,
      work_mode,
      location
    ];

    // Execute the query
    const result = await pool.query(query, values);

    // Return the new job's ID in the response
    res.status(201).json({ job_id: result.rows[0].job_id });
  } catch (error) {
    console.error('Error inserting job:', error);
    res.status(500).json({ error: 'Failed to insert job' });
  }
});

// New endpoint to fetch jobs using the get_jobs Postgres function.
// Accepts an optional recruiter_id in the request body.
router.post('/get', async (req, res) => {
  const { recruiter_id } = req.body; // recruiter_id is optional

  try {
    let query, values;
    if (recruiter_id) {
      // If recruiter_id is provided, call the function with that parameter.
      query = 'SELECT * FROM get_jobs($1)';
      values = [recruiter_id];
    } else {
      // If no parameter is provided, call the function without arguments.
      query = 'SELECT * FROM get_jobs()';
      values = [];
    }

    const result = await pool.query(query, values);
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching jobs:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

module.exports = router;
