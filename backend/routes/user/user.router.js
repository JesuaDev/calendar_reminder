
const express = require('express'); 
const { verifyFieldData } = require('../../middleware/verify_data.middleware');
const { postUser } = require('../../controllers/user/user.controller');
const router = express.Router(); 


router.post('/user', verifyFieldData(['email', 'password']), postUser);
/* router.put('/user/:id'); 
router.delete('/user/:id');  */

module.exports = router; 
