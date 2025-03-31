// routes/login-talent.js
const express = require("express");
const bcrypt = require("bcrypt");
const pool = require("../db");
const router = express.Router();

const SALT_ROUNDS = 10;

router.post("/login-talent", async (req, res) => {
  console.log("POST /login-talent hit with body:", req.body);

  const { email, password } = req.body;

  try {
    await pool.query("BEGIN");

    // 1. Check if user exists
    const existing = await pool.query(
      "SELECT * FROM user_profiles WHERE email = $1",
      [email]
    );

    if (existing.rows.length > 0) {
      const user = existing.rows[0];

      // 2. Check password
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

      // 3. Fetch talent profile
      const talent = await pool.query(
        "SELECT * FROM talent_profiles WHERE user_id = $1",
        [user.user_id]
      );

      await pool.query("COMMIT");
      return res.status(200).json({
        user,
        talent: talent.rows[0] || null,
      });
    } else {
      // 4. New user: create user_profiles
      const userInsert = await pool.query(
        `INSERT INTO user_profiles (email, full_name, user_type, oauth_provider)
         VALUES ($1, $2, $3, $4) RETURNING *`,
        [email, email.split("@")[0], "Talent", "Password"]
      );
      const newUser = userInsert.rows[0];

      // 5. Save hashed password
      const passwordHash = await bcrypt.hash(password, SALT_ROUNDS);
      await pool.query(
        `INSERT INTO user_credentials (user_id, password_hash) VALUES ($1, $2)`,
        [newUser.user_id, passwordHash]
      );

      // 6. Create basic talent_profile with just user_id
      const talentInsert = await pool.query(
        `INSERT INTO talent_profiles (user_id) VALUES ($1) RETURNING *`,
        [newUser.user_id]
      );

      await pool.query("COMMIT");
      return res.status(201).json({
        user: newUser,
        talent: talentInsert.rows[0],
      });
    }
  } catch (error) {
    await pool.query("ROLLBACK");
    console.error("Login Talent route error:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

module.exports = router;
