// routes/talentProfilesMatch.js
const express = require('express');
const router = express.Router();
const pool = require('../db');

router.post('/match', async (req, res) => {
  const { job_id, match_percentage = 80 } = req.body;

  if (!job_id) {
    return res.status(400).json({ error: "Missing job_id" });
  }

  try {
    const query = `
      WITH filtered_talent AS (
        SELECT 
          tp.talent_id,
          tp.user_id,
          tp.skills,
          tp.resume,
          tp.bio,
          tp.experience,
          tp.education,
          tp.work_preferences,
          tp.desired_salary,
          tp.location,
          tp.availability,
          tp.available_from,
          tp.requires_two_weeks_notice,
          up.email,
          up.full_name,
          up.profile_picture
        FROM public.talent_profiles tp
        JOIN public.user_profiles up ON tp.user_id = up.user_id
      ),
      job AS (
        SELECT job_id, required_skills
        FROM public.jobs
        WHERE job_id = $1
      ),
      talent_matches AS (
        SELECT
          ft.*,
          j.required_skills,
          cardinality(j.required_skills) AS total_required,
          (
            SELECT COUNT(*)
            FROM unnest(j.required_skills) AS req_skill
            WHERE LOWER(req_skill) IN (
              SELECT LOWER(skill) FROM unnest(ft.skills) AS skill
            )
          ) AS matching_count
        FROM filtered_talent ft
        CROSS JOIN job j
      )
      SELECT 
        *,
        (matching_count * 1.0 / total_required) AS match_percentage
      FROM talent_matches
      WHERE (matching_count * 1.0 / total_required) >= $2
      ORDER BY match_percentage DESC
    `;

    const threshold = match_percentage / 100;
    const { rows } = await pool.query(query, [job_id, threshold]);

    res.json(rows);
  } catch (error) {
    console.error("❌ Error in advanced match query:", error);
    res.status(500).json({ error: "An error occurred while matching talent profiles." });
  }
});

module.exports = router;
