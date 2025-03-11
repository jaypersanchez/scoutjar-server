const express = require('express');
const router = express.Router();
const pool = require('../db'); 

router.post('/', async (req, res) => {
  // Extract all parameters from the request body, applying defaults as needed.
  const { 
    min_salary = 0, 
    max_salary = null, 
    filter_location = null, 
    required_skill = null,
    job_title = null,
    preferred_work_mode = null,
    job_description = null,
    match_percentage = 0
  } = req.body;

  console.log("🔹 Received API Request with Parameters:", req.body);

  try {
    // Call the stored procedure with all 8 parameters.
    const queryText = `
      SELECT * FROM get_filtered_talent_profiles(
        p_min_salary := $1,
        p_max_salary := $2,
        p_filter_location := $3,
        p_required_skill := $4,
        p_job_title := $5,
        p_preferred_work_mode := $6,
        p_job_description := $7,
        p_match_percentage := $8
      );
    `;
    
    const queryParams = [
      min_salary,
      max_salary,
      filter_location,
      required_skill,
      job_title,
      preferred_work_mode,
      job_description,
      match_percentage
    ];

    console.log("🔹 Executing Query:", queryText);
    console.log("🔹 Query Parameters:", queryParams);

    const { rows } = await pool.query(queryText, queryParams);
    console.log("✅ Query Execution Result:", rows);
    res.json(rows);
  } catch (error) {
    console.error("❌ Error executing query:", error);
    res.status(500).json({ error: 'An error occurred while fetching talent profiles.' });
  }
});

module.exports = router;
