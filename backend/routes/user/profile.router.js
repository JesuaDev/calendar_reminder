
const express = require('express'); 
const { postProfile, getByIdProfile } = require('../../controllers/user/profile/profile.controller');
const { verifyFieldData } = require('../../middleware/verify_data.middleware');
const router = express.Router(); 


router.post('/profile', verifyFieldData(["idUser","name", "nameKeyUser"]), postProfile); 
router.get("/profile/:id", getByIdProfile); 

module.exports = router; 