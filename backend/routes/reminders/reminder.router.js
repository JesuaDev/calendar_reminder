const express = require('express'); 
const { postNewReminder } = require('../../controllers/reminders/reminder.controller');
const router = express.Router(); 


router.post('/reminder', postNewReminder)



module.exports = router; 
