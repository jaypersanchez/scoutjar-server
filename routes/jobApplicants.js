const express = require('express');
const router = express.Router();
const pool = require('../db');


// GET /job-applicants/count/:recruiter_id
router.get('/count/:recruiter_id', async (req, res) => {
  const { recruiter_id } = req.params;

  try {
    const result = await pool.query(`
      SELECT job_id, COUNT(*) AS applicant_count
      FROM job_applications
      WHERE recruiter_id = $1
      GROUP BY job_id
    `, [recruiter_id]);

    res.json(result.rows); // [{ job_id: 1, applicant_count: 5 }, ...]
  } catch (err) {
    console.error("Error fetching applicant counts:", err);
    res.status(500).json({ error: "Failed to fetch applicant counts" });
  }
});


// POST endpoint to apply for a job
router.post('/apply', async (req, res) => {
  const { talent_id, job_id } = req.body;

  // Validate required parameters
  if (!talent_id || !job_id) {
    return res.status(400).json({ error: 'talent_id and job_id are required.' });
  }

  try {
    // Call the PostgreSQL function apply_for_job using a SQL query.
    // This assumes that the function has been created in your database.
    await pool.query('SELECT apply_for_job($1, $2)', [talent_id, job_id]);
    
    res.status(200).json({ message: 'Application submitted successfully.' });
  } catch (error) {
    console.error('Error applying for job:', error);
    res.status(500).json({ error: error.message });
  }
}); 
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
