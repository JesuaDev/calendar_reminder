
const express = require('express'); 
const { postProfile } = require('../../controllers/user/profile/profile.controller');
const { verifyFieldData } = require('../../middleware/verify_data.middleware');
const router = express.Router(); 


//router.get("/profile/:id"); 
router.post('/profile', verifyFieldData(["idUser","name", "nameKeyUser"]), postProfile); 

module.exports = router; 