// routes/userProfiles.js
const express = require('express');
const router = express.Router();
const pool = require('../db'); // assuming you're using pg for Postgres

// Create or fetch user profile based on OAuth info
router.post('/', async (req, res) => {
  const {
    email,
    full_name,
    profile_picture,
  } = req.body;

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

    // User does not exist; insert new record
    const newUserQuery = `
      INSERT INTO user_profiles (email, full_name, profile_picture)
      VALUES ($1, $2, $3)
      RETURNING *;
    `;
    const newUserValues = [
      email,
      full_name,
      profile_picture,
    ];

    const result = await pool.query(newUserQuery, newUserValues);
    res.status(201).json(result.rows[0]);
  } catch (error) {
    console.error("Error inserting/fetching user profile:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

module.exports = router;
