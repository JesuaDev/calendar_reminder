const userModel = require("../../../../models/user/user.model");


exports.accessToken = async (req, res) => {
   try {
      console.log(req.user.userId)
     const userWithProfile = await userModel.findById(req.user.userId).select('-password').populate("profile");

      return res.status(200).json({ status: 200, message: "Bienvenido.", data: userWithProfile })

   } catch (err) {
      return res.status(500).json({ status: 500, message: "Hubo un error en el servidor." +err });
   }
}