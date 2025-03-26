const express = require('express');
const router = express.Router();
const pool = require('../db'); 

router.get('/:talent_id', async (req, res) => {
  const { talent_id } = req.params;

  try {
    const result = await pool.query(
      `
      SELECT tp.*, up.email, up.full_name, up.profile_picture
      FROM talent_profiles tp
      JOIN user_profiles up ON tp.user_id = up.user_id
      WHERE tp.talent_id = $1
      `,
      [talent_id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: "Talent not found" });
    }

    res.json(result.rows[0]);
  } catch (err) {
    console.error("Error fetching talent profile:", err);
    res.status(500).json({ error: "Internal server error" });
  }
});

router.post('/', async (req, res) => {
  // Extract all parameters from the request body, applying defaults as needed.
  const { 
    min_salary = 0, 
    max_salary = null, 
    required_skill = null,
    job_title = null,
    job_description = null
  } = req.body;
  

  console.log("🔹 Received API Request with Parameters:", req.body);

  try {
    // Call the stored procedure with all 8 parameters.
    const queryText = `
      SELECT * FROM get_filtered_talent_profiles(
        p_min_salary := $1,
        p_max_salary := $2,
        p_required_skill := $3,
        p_job_title := $4,
        p_job_description := $5
      );
    `;
    
    const queryParams = [
      min_salary,
      max_salary,
      required_skill,
      job_title,
      job_description
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
