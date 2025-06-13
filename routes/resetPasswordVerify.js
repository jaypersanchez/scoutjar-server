// routes/resetPasswordVerify.js
const express = require("express");
const bcrypt = require("bcrypt");
const pool = require("../db");
const router = express.Router();

router.get("/verify/:token", async (req, res) => {
  const { token } = req.params;

  try {
    const result = await pool.query(
      `SELECT * FROM password_resets
       WHERE token = $1 AND expires_at > NOW()`,
      [token]
    );

    if (result.rowCount === 0) {
      return res.status(400).json({ error: "Invalid or expired token" });
    }

    res.status(200).json({ message: "Token is valid" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Server error" });
  }
});

router.post("/new-password", async (req, res) => {
  const { token, password } = req.body;

  try {
    const result = await pool.query(
      `SELECT * FROM password_resets
       WHERE token = $1 AND expires_at > NOW()`,
      [token]
    );

    if (result.rowCount === 0) {
      return res.status(400).json({ error: "Invalid or expired token" });
    }

    const userId = result.rows[0].user_id;
    const hash = await bcrypt.hash(password, 10);

    await pool.query(
      `UPDATE user_credentials
       SET password_hash = $1 WHERE user_id = $2`,
      [hash, userId]
    );

    // Clean up the reset token
    await pool.query(
      `DELETE FROM password_resets WHERE user_id = $1`,
      [userId]
    );

    res.status(200).json({ message: "Password updated successfully" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Server error" });
  }
});

module.exports = router;
