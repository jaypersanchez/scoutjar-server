// routes/talentProfiles.js
const express = require('express');
const router = express.Router();
const pool = require('../db'); 

router.post('/', async (req, res) => {
  // Set default values in case they are not provided in the request body.
  const { 
    min_salary = 0, 
    max_salary = null, 
    filter_location = null, 
    required_skill = null 
  } = req.body;

  console.log("🔹 Received API Request with Parameters:", req.body);

  try {
    const queryText = `
      SELECT * 
      FROM get_filtered_talent_profiles($1, $2, $3, $4);
    `;
    
    console.log("🔹 Executing Query:", queryText);
    console.log("🔹 Query Parameters:", [min_salary, max_salary, filter_location, required_skill]);

    const { rows } = await pool.query(queryText, [min_salary, max_salary, filter_location, required_skill]);

    console.log("✅ Query Execution Result:", rows);

    res.json(rows);
  } catch (error) {
    console.error("❌ Error executing query:", error);
    res.status(500).json({ error: 'An error occurred while fetching talent profiles.' });
  }
});

module.exports = router;
