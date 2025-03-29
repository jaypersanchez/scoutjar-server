const express = require('express');
const router = express.Router();
const pool = require('../db'); 

// Fetch company info by recruiter ID
router.get('/by-recruiter/:recruiter_id', async (req, res) => {
  const { recruiter_id } = req.params;

  try {
    const result = await pool.query(
      `
      SELECT company_name, company_website
      FROM talent_recruiters
      WHERE recruiter_id = $1
      `,
      [recruiter_id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: "Recruiter profile not found" });
    }

    res.json(result.rows[0]);
  } catch (err) {
    console.error("Error fetching recruiter profile:", err);
    res.status(500).json({ error: "Internal server error" });
  }
});

// Update company name and website using recruiter ID
router.post('/update', async (req, res) => {
  const { recruiter_id, company, website } = req.body;

  if (!recruiter_id) {
    return res.status(400).json({ error: "Missing recruiter_id" });
  }

  try {
    const updateResult = await pool.query(
      `
      UPDATE talent_recruiters
      SET company_name = $1, company_website = $2
      WHERE recruiter_id = $3
      RETURNING company_name, company_website;
      `,
      [company, website, recruiter_id]
    );

    res.json(updateResult.rows[0]);
  } catch (err) {
    console.error("Error updating recruiter profile:", err);
    res.status(500).json({ error: "Internal server error" });
  }
});


// Update company name and website
/*router.post('/update', async (req, res) => {
  const { email, company, website } = req.body;

  try {
    const userResult = await pool.query(
      'SELECT user_id FROM user_profiles WHERE email = $1',
      [email]
    );

    if (userResult.rows.length === 0) {
      return res.status(404).json({ error: "User not found" });
    }

    const user_id = userResult.rows[0].user_id;

    const updateResult = await pool.query(
      `
      UPDATE talent_recruiters
      SET company_name = $1, company_website = $2
      WHERE user_id = $3
      RETURNING company_name, company_website;
      `,
      [company, website, user_id]
    );

    res.json(updateResult.rows[0]);
  } catch (err) {
    console.error("Error updating recruiter profile:", err);
    res.status(500).json({ error: "Internal server error" });
  }
});*/


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

/*router.post('/', async (req, res) => {
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
}*/

router.post('/', async (req, res) => {
  const {
    min_salary = 0,
    max_salary = null,
    required_skill = null,
    job_title = null,
    job_description = null,
    location = null,
    availability = null,
    work_mode = null,
    match_percentage = 0
  } = req.body;

  console.log("🔹 Received API Request with Parameters:", req.body);

  try {
    const queryText = `
      SELECT * FROM get_filtered_talent_profiles(
        p_min_salary := $1,
        p_max_salary := $2,
        p_required_skill := $3,
        p_job_title := $4,
        p_job_description := $5,
        p_location := $6,
        p_availability := $7,
        p_work_mode := $8,
        p_match_percentage := $9
      );
    `;

    const queryParams = [
      min_salary,
      max_salary,
      required_skill,
      job_title,
      job_description,
      location,
      availability,
      work_mode,
      match_percentage
    ];

    console.log("🔹 Executing Query:", queryText);
    console.log("🔹 Query Parameters:", queryParams);

    const { rows } = await pool.query(queryText, queryParams);
    console.log("✅ Query Execution Result:", rows.length, "rows");
    res.json(rows);
  } catch (error) {
    console.error("❌ Error executing query:", error);
    res.status(500).json({ error: 'An error occurred while fetching talent profiles.' });
  }
});

module.exports = router;
