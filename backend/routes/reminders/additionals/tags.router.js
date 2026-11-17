const express = require('express'); 
const { postTag } = require('../../../controllers/reminders/additionals/tags.controller');
const router = express.Router(); 

router.post('/tag', postTag);

module.exports = postTag; 