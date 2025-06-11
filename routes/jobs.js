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
      recruiter_id || null,
      job_title,
      job_description,
      Array.isArray(required_skills) ? required_skills : [], // safe fallback
      experience_level || null,
      employment_type || null,
      Array.isArray(salary_range) ? salary_range : [null, null], // safe fallback
      work_mode || null,
      location || null
    ];


    // Execute the query
    const result = await pool.query(query, values);

    // Return the new job's ID in the response
    //res.status(201).json({ job_id: result.rows[0].job_id });
    const jobId = result.rows[0].job_id;
    if (!jobId) {
      console.error('[ERROR] insert_job returned NULL. Insert likely failed silently.');
      return res.status(500).json({ error: 'Insert failed silently. Check server logs or DB.' });
    }
    // ✅ Insert currency only after jobId is confirmed
    await pool.query(
      `INSERT INTO job_currency (job_id, currency) VALUES ($1, $2)`,
      [jobId, req.body.salary_currency || 'USD']
    );

    console.log('[SUCCESS] Job inserted with ID:', jobId);
    res.status(201).json({ job_id: jobId });

  } catch (error) {
    console.error('Error inserting job:', error);
    res.status(500).json({ error: 'Failed to insert job' });
  }
});

// Gets the currency that is set for the related job id
router.get('/currency/:job_id', async (req, res) => {
  const jobId = req.params.job_id;

  try {
    const result = await pool.query(
      'SELECT currency FROM job_currency WHERE job_id = $1',
      [jobId]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Currency not found' });
    }

    res.json({ currency: result.rows[0].currency });
  } catch (error) {
    console.error('Error fetching currency:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// This is a secondary query called from the Job Post list to get the associated currency. 
// Avoiding having to change code on Postgres function
router.get('/jobs/currency/:job_id', async (req, res) => {
  const { job_id } = req.params;
  const result = await pool.query('SELECT currency FROM job_currency WHERE job_id = $1', [job_id]);
  res.json({ currency: result.rows[0]?.currency || 'USD' });
});


// Simple GET route for dropdowns like job matching UI
router.get('/', async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT job_id, job_title 
      FROM public.jobs 
      ORDER BY date_posted DESC
    `);
    res.json(result.rows);
  } catch (err) {
    console.error("Error fetching jobs for dropdown:", err);
    res.status(500).json({ error: "Failed to fetch jobs list" });
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
