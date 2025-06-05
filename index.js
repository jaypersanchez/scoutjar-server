const express = require('express');
const cors = require('cors');
const path = require('path');
const fs = require('fs'); 
const https = require('https');  
const app = express();
const api = express.Router();
const port = process.env.PORT || 5000;
const pool = require('./db');

require('dotenv').config();

const sslOptions = {
  key: fs.readFileSync('./server.key'),
  cert: fs.readFileSync('./server.cert'),
};

// Middleware to parse JSON requests
app.use(cors());
app.use('/api',api)

// In your main server file (e.g., index.js or app.js)
app.use('/api//uploads', express.static(path.join(__dirname, 'public/uploads')));


app.use(express.json());
const baseUrl = `${process.env.SCOUTJAR_SERVER_BASE_URL}:${process.env.SCOUTJAR_SERVER_BASE_PORT}`;

//const AIbaseURL = `${import.meta.env.VITE_SCOUTJAR_AI_BASE_URL}${import.meta.env.VITE_SCOUTJAR_AI_BASE_PORT}`;

// Endpoint to test the database connection
app.get('/api/dbtest', async (req, res) => {
    try {
      console.log(pool)
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
app.use('/api/talent-profiles', talentProfilesRouter);

const jobsRouter = require('./routes/jobs');
app.use('/api/jobs', jobsRouter);

// Mount the job applicants route
const jobApplicantsRouter = require('./routes/jobApplicants');
app.use('/api/job-applicants', jobApplicantsRouter);

const searchJobsRouter = require('./routes/searchJobs');
app.use('/api/search-jobs', searchJobsRouter);

// in your index.js or server.js
const userProfilesRouter = require('./routes/userProfiles');
app.use('/api/user_profiles', userProfilesRouter);

const locationsRouter = require('./routes/locations');
app.use('/api/locations', locationsRouter);

// Other existing requires and middleware
const recruiterApplicationsRouter = require('./routes/recruiterApplications');
app.use('/api/recruiter-applications', recruiterApplicationsRouter);

const jobTitlesRouter = require('./routes/jobTitles');
app.use('/api/job-titles', jobTitlesRouter);

const shortlistedCandidatesRouter = require('./routes/shortlistedCandidates');
app.use('/api/shortlisted-candidates', shortlistedCandidatesRouter);

const messagesRouter = require('./routes/messages');
app.use('/api/messages', messagesRouter);

const talentProfilesMatchRouter = require('./routes/talentProfilesMatch');
app.use('/api/talent-profiles', talentProfilesMatchRouter);

/** This login route are for recruiters */
const loginRouter = require('./routes/login');
app.use('/api/login', loginRouter);

/**This login route are for talent login */
const loginTalentRoute = require("./routes/login-talent");
app.use("/api", loginTalentRoute);

/** Proxy image to resolve Google's ORBS image so image will show on Profile */
app.get('/api/proxy-image', async (req, res) => {
  const imageUrl = req.query.url;

  if (!imageUrl || !imageUrl.startsWith('https://')) {
    return res.status(400).send('Invalid image URL.');
  }

  // Optional security check – allow only Google-hosted profile pictures
  if (!imageUrl.startsWith('https://lh3.googleusercontent.com')) {
    return res.status(403).send('Blocked image host.');
  }

  try {
    const response = await fetch(imageUrl);

    if (!response.ok) {
      return res.status(500).send('Failed to fetch image.');
    }

    const contentType = response.headers.get('content-type');
    res.setHeader('Content-Type', contentType);
    response.body.pipe(res);
  } catch (err) {
    console.error('Image proxy failed:', err);
    res.status(500).send('Proxy error.');
  }
});



// Basic route
app.get('/api', (req, res) => {
    res.send('Welcome to ScoutJar Server Side Express!');
});

// Start server
/*app.listen(port, '0.0.0.0', () => {
    console.log(`Server is running on ${baseUrl}`);
});*/
/*app.listen(process.env.PORT || 5000, process.env.HOST || '0.0.0.0', () => {
  console.log(`Server running on ${process.env.HOST}:${process.env.PORT}`);
});*/

https.createServer(sslOptions, app).listen(port, '0.0.0.0', () => {
  console.log(`🔐 HTTPS server running at https://0.0.0.0:${port}`);
});

