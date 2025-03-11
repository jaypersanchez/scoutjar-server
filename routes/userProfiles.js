// routes/userProfiles.js
const express = require('express');
const router = express.Router();
const pool = require('../db'); // assuming you're using pg for Postgres

router.post('/', async (req, res) => {
  const { email, full_name, profile_picture, user_type } = req.body;

  try {
    // Start a transaction for consistency
    await pool.query('BEGIN');

    // Check if user already exists
    const existing = await pool.query(
      'SELECT * FROM user_profiles WHERE email = $1',
      [email]
    );

    if (existing.rows.length > 0) {
      const existingUser = existing.rows[0];
      // Fetch the associated talent recruiter record
      const recruiterResult = await pool.query(
        'SELECT * FROM talent_recruiters WHERE user_id = $1',
        [existingUser.user_id]
      );
      const existingRecruiter = recruiterResult.rows[0];
      
      await pool.query('COMMIT');
      // Return both the user and recruiter records
      return res.status(200).json({ user: existingUser, recruiter: existingRecruiter });
    } else {
      // New user: create the user_profiles record
      const newUserQuery = `
        INSERT INTO user_profiles (email, full_name, profile_picture, user_type)
        VALUES ($1, $2, $3, $4)
        RETURNING *;
      `;
      const newUserValues = [email, full_name, profile_picture, user_type];
      const userResult = await pool.query(newUserQuery, newUserValues);
      const newUser = userResult.rows[0];

      // Create the corresponding record in talent_recruiters
      const newRecruiterQuery = `
        INSERT INTO talent_recruiters (user_id, company_name, company_logo)
        VALUES ($1, $2, $3)
        RETURNING *;
      `;
      const newRecruiterValues = [newUser.user_id, full_name, profile_picture];
      const recruiterResult = await pool.query(newRecruiterQuery, newRecruiterValues);
      const newRecruiter = recruiterResult.rows[0];

      await pool.query('COMMIT');
      // Return both the new user and recruiter records
      return res.status(201).json({ user: newUser, recruiter: newRecruiter });
    }
  } catch (error) {
    await pool.query('ROLLBACK');
    console.error("Error inserting/fetching user profile:", error);
    return res.status(500).json({ error: "Internal server error" });
  }
});

module.exports = router;
