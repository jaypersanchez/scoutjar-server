// routes/talentProfiles.js
const express = require('express');
const router = express.Router();
const pool = require('../db'); // Import the shared connection
const logger = require('./logger'); // Import the logger we just created

// POST endpoint to fetch filtered talent profiles
router.post('/', async (req, res) => {
  // Set default values in case they are not provided in the request body.
  const { 
    min_salary = 0, 
    max_salary = null, 
    filter_location = null, 
    required_skill = null 
  } = req.body;
  
  try {
    const queryText = `
      SELECT * 
      FROM get_filtered_talent_profiles($1, $2, $3, $4);
    `;
    const { rows } = await pool.query(queryText, [min_salary, max_salary, filter_location, required_skill]);
    
    // Log the data being sent back
    logger.info('Talent profiles retrieved successfully', { count: rows.length, filters: req.body });
    
    res.json(rows);
  } catch (error) {
    // Log the error with details
    logger.error('Error fetching talent profiles', { error: error.message, filters: req.body });
    
    res.status(500).json({ error: 'An error occurred while fetching talent profiles.' });
  }
});

module.exports = router;
