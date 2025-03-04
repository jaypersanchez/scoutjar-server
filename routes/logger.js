// routes/logger.js
const winston = require('winston');
const path = require('path');

const logFilePath = path.join(__dirname, 'app.log'); // Log file will be created in the routes directory

const logger = winston.createLogger({
  level: 'info',
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.json()
  ),
  transports: [
    new winston.transports.File({ filename: logFilePath })
  ]
});

// Optionally, if you're not in production, you can also log to the console.
if (process.env.NODE_ENV !== 'production') {
  logger.add(new winston.transports.Console({
    format: winston.format.simple()
  }));
}

module.exports = logger;
