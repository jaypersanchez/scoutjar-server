const express = require('express');
const router = express.Router();
const pool = require('../db'); // Import database connection

// Combine all locations as "City, Country"
router.get('/all', async (req, res) => {
    try {
      const result = await pool.query(`
        SELECT DISTINCT country, region, city, country_code
        FROM locations
        ORDER BY country ASC, region ASC, city ASC
      `);
  
      /*const locations = result.rows.map(row => ({
        label: `${row.city}, ${row.region}, ${row.country}`,
        value: `${row.city}, ${row.region}, ${row.country}`,
      }));*/
      const locations = result.rows.map(row => {
        const parts = [row.city, row.region, row.country].filter(p => p && p.toLowerCase() !== 'null');
        const label = parts.join(', ');
        //const code = row.country_code?.toLowerCase();
        const code = row.country_code?.toUpperCase().slice(0, 2); // turns "USA" → "US"

        return { label, value: label,code };
      });
  
      res.json(locations);
    } catch (err) {
      console.error("Error fetching full location list:", err);
      res.status(500).json({ error: "Internal Server Error" });
    }
  });
  

  
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
