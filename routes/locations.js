const express = require('express');
const router = express.Router();
const pool = require('../db'); // Import database connection

// Get unique countries in alphabetical order
router.get('/countries', async (req, res) => {
    try {
        const result = await pool.query(
            `SELECT DISTINCT country FROM locations ORDER BY country ASC`
        );
        res.json(result.rows.map(row => row.country));
    } catch (error) {
        console.error('Error fetching countries:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Get cities based on country, sorted alphabetically
router.get('/cities', async (req, res) => {
    try {
        const { country } = req.query;
        if (!country) {
            return res.status(400).json({ error: "Country is required" });
        }

        const result = await pool.query(
            `SELECT DISTINCT city FROM locations WHERE country = $1 ORDER BY city ASC`,
            [country]
        );
        res.json(result.rows.map(row => row.city));
    } catch (error) {
        console.error('Error fetching cities:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

module.exports = router;
