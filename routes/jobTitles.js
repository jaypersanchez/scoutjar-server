const express = require('express');
const router = express.Router();
const pool = require('../db');

// Get all job titles (or with optional query param for filtering)
app.get('/job-titles', async (req, res) => {
  const { q } = req.query;
  const titles = await db.query(`
    SELECT DISTINCT job_title 
    FROM job_titles 
    WHERE job_title ILIKE $1
    ORDER BY job_title ASC
  `, [`%${q || ''}%`]);
  res.json(titles.rows.map(row => row.job_title));
});

// Get unique job categories
app.get('/job-categories', async (req, res) => {
  const { q } = req.query;
  const categories = await db.query(`
    SELECT DISTINCT job_category 
    FROM job_titles 
    WHERE job_category ILIKE $1
    ORDER BY job_category ASC
  `, [`%${q || ''}%`]);
  res.json(categories.rows.map(row => row.job_category));
});

router.get('/', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM job_titles ORDER BY job_title ASC');
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching job titles:', error);
    res.status(500).json({ error: 'Failed to fetch job titles' });
  }
});

module.exports = router;
