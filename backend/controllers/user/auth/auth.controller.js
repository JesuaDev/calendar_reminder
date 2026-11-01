const bcrypt = require('bcryptjs');
const userModel = require('../../../models/user/user.model');
const profileModel = require('../../../models/user/profile/profile.model');
const { authorizateUser } = require('../../../utils/tokens/tokens.util');
const refresh_tokenModel = require('../../../models/user/auth/refresh_token.model');


exports.authUser = async (req, res) => {
    try {
        const { email, password, uuid } = req.body;

        let user;

        if (email.includes("@")) {
            user = await userModel.findOne({ email });

        } else {
            const profile = await profileModel.findOne({ nameKeyUser: email });

            if (profile) {
                user = await userModel.findById(profile.user);
            }
        }

        if (!user || await !bcrypt.compare(password, user.password)) {
            return res.status(401).json({ status: 401, message: "Credenciales Inválidas" });
        }

        const tokens = authorizateUser(user);
        const userWithProfile = await userModel.findById(user._id).select('-password').populate("profile");
        
      await refresh_tokenModel.create({
            user: user._id,
            tokenHash: tokens.refreshToken,
            deviceId: uuid,
            revoked: false,
            replaceBy: tokens.refreshToken
        }); 
        
        console.log(userWithProfile); 
        console.log(tokens);

        return res.status(200).json({ status: 200, message: "Inicio sesión correctamente.", data: userWithProfile, tokens: tokens })


    } catch (err) {
        return res.status(500).json({ status: 500, message: "Hubo un error " +err });
    }
}