const express = require('express'); 
const router = express.Router(); 

const { postPublication } = require('../../../controllers/user/profile/publication.controller');

router.post('/publication', postPublication); 


module.exports = router; 



