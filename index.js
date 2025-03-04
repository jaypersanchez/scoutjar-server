const express = require('express');
const cors = require('cors');
const app = express();
const port = process.env.PORT || 5000;
const pool = require('./db');

// Middleware to parse JSON requests
app.use(cors());
app.use(express.json());

// Endpoint to test the database connection
app.get('/dbtest', async (req, res) => {
    try {
      const result = await pool.query('SELECT NOW()');
      res.json({
        message: 'Database connection successful!',
        current_time: result.rows[0].now,
      });
    } catch (error) {
      console.error('Error testing DB connection:', error);
      res.status(500).json({ error: 'Database connection failed' });
    }
});

// Import the talent profiles router
const talentProfilesRouter = require('./routes/talentProfiles');

// Mount the router at the /talent-profiles endpoint
app.use('/talent-profiles', talentProfilesRouter);

// Basic route
app.get('/', (req, res) => {
    res.send('Welcome to ScoutJar Server Side Express!');
});

// Start server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
