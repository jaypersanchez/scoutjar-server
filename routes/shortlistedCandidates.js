const express = require('express');
const router = express.Router();
const pool = require('../db');

// POST endpoint to fetch shortlisted candidates grouped by job_id for a specific recruiter
router.post('/grouped', async (req, res) => {
  const { recruiter_id } = req.body;

  if (!recruiter_id) {
    return res.status(400).json({ error: 'recruiter_id is required' });
  }

  try {
    const query = `
      SELECT sc.job_id,
             json_agg(
               json_build_object(
                 'shortlist_id', sc.shortlist_id,
                 'recruiter_id', sc.recruiter_id,
                 'talent_id', sc.talent_id,
                 'added_at', sc.added_at,
                 'email', up.email,
                 'full_name', up.full_name
               )
             ) AS candidates
      FROM shortlisted_candidates sc
      JOIN talent_profiles tp ON sc.talent_id = tp.talent_id
      JOIN user_profiles up ON tp.user_id = up.user_id
      WHERE sc.recruiter_id = $1
      GROUP BY sc.job_id
      ORDER BY sc.job_id;
    `;
    const values = [recruiter_id];
    const result = await pool.query(query, values);
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching grouped shortlisted candidates:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});


// POST endpoint to add a shortlisted candidate
router.post('/add', async (req, res) => {
  const { recruiter_id, talent_id, job_id } = req.body;
  console.log(recruiter_id, talent_id, job_id)
  // Validate required parameters
  if (!recruiter_id || !talent_id || !job_id) {
    return res.status(400).json({ error: 'recruiter_id, talent_id, and job_id are required.' });
  }

  try {
    // Call the PostgreSQL function add_shortlisted_candidate
    const query = 'SELECT add_shortlisted_candidate($1, $2, $3) AS shortlist_id';
    const values = [recruiter_id, talent_id, job_id];
    const result = await pool.query(query, values);
    
    res.status(200).json({ message: 'Candidate shortlisted successfully', shortlist_id: result.rows[0].shortlist_id });
  } catch (error) {
    console.error('Error adding shortlisted candidate:', error);
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
