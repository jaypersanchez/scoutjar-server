const express = require('express');
const router = express.Router();
const pool = require('../db');

// POST endpoint to send a message
router.post('/send', async (req, res) => {
  const { sender_id, recipient_id, content } = req.body;
  
  if (!sender_id || !recipient_id || !content) {
    return res.status(400).json({ error: "sender_id, recipient_id, and content are required." });
  }
  
  try {
    const query = `
      INSERT INTO messages (sender_id, recipient_id, content)
      VALUES ($1, $2, $3)
      RETURNING message_id, sent_at;
    `;
    const values = [sender_id, recipient_id, content];
    const result = await pool.query(query, values);
    res.status(201).json({
      message: "Message sent successfully",
      message_id: result.rows[0].message_id,
      sent_at: result.rows[0].sent_at
    });
  } catch (error) {
    console.error("Error sending message:", error);
    res.status(500).json({ error: "Failed to send message" });
  }
});

// GET endpoint to fetch conversation history between two users
router.get('/history', async (req, res) => {
    const { sender_id, recipient_id } = req.query;
    
    if (!sender_id || !recipient_id) {
      return res.status(400).json({ error: "sender_id and recipient_id are required." });
    }
    
    try {
      const query = `
        SELECT message_id, sender_id, recipient_id, content, sent_at
        FROM messages
        WHERE (sender_id = $1 AND recipient_id = $2)
           OR (sender_id = $2 AND recipient_id = $1)
        ORDER BY sent_at ASC;
      `;
      const values = [sender_id, recipient_id];
      const result = await pool.query(query, values);
      res.json(result.rows);
    } catch (error) {
      console.error("Error fetching conversation history:", error);
      res.status(500).json({ error: "Failed to fetch conversation history" });
    }
  });

  
module.exports = router;
