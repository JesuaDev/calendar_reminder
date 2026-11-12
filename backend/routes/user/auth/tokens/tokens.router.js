const express = require('express'); 
const router = express.Router(); 
const { accessToken } = require('../../../../controllers/user/auth/tokens/tokens.controller');
const {  verifyToken } = require('../../../../middleware/verify_login.middleware');

router.get('/token', verifyToken , accessToken);

module.exports = router; 


