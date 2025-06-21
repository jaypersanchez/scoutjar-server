// routes/resetPasswordRequest.js
const express = require("express");
const crypto = require("crypto");
const pool = require("../db");
const router = express.Router();
const nodemailer = require("nodemailer");

//const baseUrl = `${process.env.SCOUTJAR_SERVER_BASE_URL || 'http://localhost'}:${process.env.SCOUTJAR_SERVER_BASE_PORT || 5000}`;
const baseUrl = `${process.env.SCOUTJAR_SERVER_BASE_URL}`
const frontEndResetPassword = `${process.env.FRONTEND_RESET_PASSWORD}`
const transporter = nodemailer.createTransport({
  host: process.env.SMTP_HOST,
  port: process.env.SMTP_PORT,
  secure: false, //process.env.SMTP_PORT, // true for 465, false for 587
  auth: {
    user: process.env.SMTP_USER_NAME,     // e.g. 'noreply@lookk.ai'
    pass: process.env.SMTP_PASSWORD, // your email password
  },
});
console.log(
  `${baseUrl}::${process.env.SMTP_HOST}::${frontEndResetPassword}::${process.env.SMTP_PORT}::
  ${process.env.SMTP_USER_NAME}::${process.env.SMTP_PASSWORD}`)

router.post("/request-reset", async (req, res) => {
  const { email } = req.body;
  const token = crypto.randomBytes(32).toString("hex");
  const tokenExpiry = Date.now() + 1000 * 60 * 60; // 1 hour
  console.log(`Password Reset Request ${email}::${token}::${tokenExpiry}`)
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
    console.log(`Reset link: ${frontEndResetPassword}/reset-password/${token}`);
    const resetLink = `${frontEndResetPassword}/reset-password/${token}`
    await transporter.sendMail({
      from: '"LooKK Support" <no-reply@lookk.ai>',
      to: email,
      subject: "Password Reset Request",
      html: `<p>You requested a password reset. Click <a href="${resetLink}">here</a> to reset your password.</p>`
    });

    res.status(200).json({ message: "Reset link sent if email exists." });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Server error" });
  }
});

module.exports = router;
