const crypto = require('crypto');
const jwt = require('jsonwebtoken');

generateRefreshToken = () => crypto.randomBytes(40).toString('hex');

generateAccessToken = (userId) => jwt.sign({ userId }, process.env.SECRET_TOKEN, { expiresIn: "1h" });

exports.authorizateUser = (user) => {

    const accessToken = generateAccessToken(user._id); 
    const refreshToken = generateRefreshToken(); 
    user.save(); 
    return {accessToken, refreshToken}; 
}