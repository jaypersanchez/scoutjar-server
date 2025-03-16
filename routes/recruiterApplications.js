const express = require('express');
const router = express.Router();
const pool = require('../db'); // Ensure the path is correct

// GET /recruiter-applications/:recruiterId
router.get('/:recruiterId', async (req, res) => {
  const { recruiterId } = req.params;
  try {
    // Call the PostgreSQL function with the recruiterId parameter
    const result = await pool.query(
      'SELECT * FROM get_recruiter_applications($1)',
      [recruiterId]
    );
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching recruiter applications:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;
