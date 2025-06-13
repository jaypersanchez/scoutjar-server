// routes/resetPasswordRequest.js
const express = require("express");
const crypto = require("crypto");
const pool = require("../db");
const router = express.Router();

router.post("/request-reset", async (req, res) => {
  const { email } = req.body;
  const token = crypto.randomBytes(32).toString("hex");
  const tokenExpiry = Date.now() + 1000 * 60 * 60; // 1 hour

  try {
    const userRes = await pool.query(
      "SELECT user_id FROM user_profiles WHERE email = $1",
      [email]
    );

    if (userRes.rowCount === 0) {
      return res.status(404).json({ error: "Email not found" });
    }

    const userId = userRes.rows[0].user_id;

    await pool.query(`
      INSERT INTO password_resets (user_id, token, expires_at)
      VALUES ($1, $2, to_timestamp($3 / 1000.0))
      ON CONFLICT (user_id) DO UPDATE
      SET token = $2, expires_at = to_timestamp($3 / 1000.0)
    `, [userId, token, tokenExpiry]);

    // Replace with real email send once SMTP is working
    console.log(`Reset link: https://lookk.ai/auth/reset-password/${token}`);

    res.status(200).json({ message: "Reset link sent if email exists." });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Server error" });
  }
});

module.exports = router;
