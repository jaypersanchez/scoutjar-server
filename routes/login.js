// routes/login.js
const express = require("express");
const bcrypt = require("bcrypt");
const pool = require("../db");
const router = express.Router();

const SALT_ROUNDS = 10;

router.post("/", async (req, res) => {
  console.log("POST /login hit with body:", req.body);

  const { email, password } = req.body;

  try {
    await pool.query("BEGIN");

    // Check if user exists
    const existing = await pool.query(
      "SELECT * FROM user_profiles WHERE email = $1",
      [email]
    );

    if (existing.rows.length > 0) {
      const user = existing.rows[0];

      // Check password
      const credentials = await pool.query(
        "SELECT * FROM user_credentials WHERE user_id = $1",
        [user.user_id]
      );

      if (credentials.rows.length === 0) {
        await pool.query("ROLLBACK");
        return res.status(401).json({ error: "No password set for this account" });
      }

      const isMatch = await bcrypt.compare(password, credentials.rows[0].password_hash);
      if (!isMatch) {
        await pool.query("ROLLBACK");
        return res.status(401).json({ error: "Invalid credentials" });
      }

      // Fetch recruiter (optional)
      const recruiter = await pool.query(
        "SELECT * FROM talent_recruiters WHERE user_id = $1",
        [user.user_id]
      );

      await pool.query("COMMIT");
      return res.status(200).json({
        user,
        recruiter: recruiter.rows[0] || null,
      });
    } else {
      // New user: create profile and recruiter
      const userInsert = await pool.query(
        `INSERT INTO user_profiles (email, full_name, user_type, oauth_provider)
         VALUES ($1, $2, $3, $4) RETURNING *`,
        [email, email.split("@")[0], "Scout", "Password"]
      );
      const newUser = userInsert.rows[0];

      // Hash and store password
      const passwordHash = await bcrypt.hash(password, SALT_ROUNDS);
      await pool.query(
        `INSERT INTO user_credentials (user_id, password_hash) VALUES ($1, $2)`,
        [newUser.user_id, passwordHash]
      );

      // Create recruiter
      const recruiterInsert = await pool.query(
        `INSERT INTO talent_recruiters (user_id, company_name)
         VALUES ($1, $2) RETURNING *`,
        [newUser.user_id, newUser.full_name]
      );

      await pool.query("COMMIT");
      return res.status(201).json({
        user: newUser,
        recruiter: recruiterInsert.rows[0],
      });
      //await pool.query("ROLLBACK");
+     res.status(401).json({ error: "Invalid email or password" });
    }
  } catch (error) {
    await pool.query("ROLLBACK");
    console.error("Login route error:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

module.exports = router;
