// routes/userProfiles.js
const express = require('express');
const router = express.Router();
const pool = require('../db'); // assuming you're using pg for Postgres

// Create or fetch user profile based on OAuth info and create a matching talent_recruiters record
router.post('/', async (req, res) => {
  const { email, full_name, profile_picture, user_type } = req.body;

  try {
    // Check if user already exists
    const existing = await pool.query(
      'SELECT * FROM user_profiles WHERE email = $1',
      [email]
    );

    if (existing.rows.length > 0) {
      // User exists; return the user profile
      return res.status(200).json(existing.rows[0]);
    }

    // Start a transaction so both inserts succeed or fail together
    await pool.query('BEGIN');

    // Insert new user profile record
    const newUserQuery = `
      INSERT INTO user_profiles (email, full_name, profile_picture, user_type)
      VALUES ($1, $2, $3, $4)
      RETURNING *;
    `;
    const newUserValues = [email, full_name, profile_picture, user_type];
    const userResult = await pool.query(newUserQuery, newUserValues);
    const newUser = userResult.rows[0];

    // Insert corresponding record in talent_recruiters
    // Here we're using full_name as company_name and profile_picture as company_logo
    const newRecruiterQuery = `
      INSERT INTO talent_recruiters (user_id, company_name, company_logo)
      VALUES ($1, $2, $3)
      RETURNING *;
    `;
    const newRecruiterValues = [newUser.user_id, full_name, profile_picture];
    const recruiterResult = await pool.query(newRecruiterQuery, newRecruiterValues);
    const newRecruiter = recruiterResult.rows[0];

    // Commit the transaction if both inserts succeed
    await pool.query('COMMIT');

    // Return both the user profile and the talent recruiter record in one response
    return res.status(201).json({ user: newUser, recruiter: newRecruiter });
  } catch (error) {
    // If any error occurs, rollback the transaction
    await pool.query('ROLLBACK');
    console.error("Error inserting/fetching user profile:", error);
    return res.status(500).json({ error: "Internal server error" });
  }
});

module.exports = router;
