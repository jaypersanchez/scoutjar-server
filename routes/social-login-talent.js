// routes/social-login-talent.js
const express = require("express");
const pool = require("../db");
const router = express.Router();

router.post("/", async (req, res) => {
  const {
    email,
    full_name,
    profile_picture,
    oauth_provider,
    oauth_provider_id,
    social_profile_url,
  } = req.body;

  if (!email || !oauth_provider) {
    return res.status(400).json({ error: "Missing email or oauth_provider" });
  }

  try {
    await pool.query("BEGIN");

    // Upsert user_profiles
    const userResult = await pool.query(
      `
      INSERT INTO user_profiles (
        email, full_name, profile_picture,
        user_type, oauth_provider, oauth_provider_id, social_profile_url
      )
      VALUES ($1, $2, $3, 'Talent', $4, $5, $6)
      ON CONFLICT (email) DO UPDATE SET
        full_name = EXCLUDED.full_name,
        profile_picture = EXCLUDED.profile_picture,
        oauth_provider = EXCLUDED.oauth_provider,
        oauth_provider_id = EXCLUDED.oauth_provider_id,
        social_profile_url = EXCLUDED.social_profile_url
      RETURNING *;
      `,
      [
        email,
        full_name || email.split("@")[0],
        profile_picture || null,
        oauth_provider,
        oauth_provider_id || null,
        social_profile_url || null,
      ]
    );

    const user = userResult.rows[0];

    // Ensure talent_profiles row exists
    const talentInsert = await pool.query(
      `
      INSERT INTO talent_profiles (user_id)
      VALUES ($1)
      ON CONFLICT (user_id) DO NOTHING
      RETURNING *;
      `,
      [user.user_id]
    );

    const talent =
      talentInsert.rows[0] ||
      (
        await pool.query(
          `SELECT * FROM talent_profiles WHERE user_id = $1`,
          [user.user_id]
        )
      ).rows[0];

    await pool.query("COMMIT");
    return res.status(200).json({ user, talent });
  } catch (err) {
    await pool.query("ROLLBACK");
    console.error("🔥 Error in /social-login-talent:", err);
    return res.status(500).json({ error: "Internal server error" });
  }
});

module.exports = router;
