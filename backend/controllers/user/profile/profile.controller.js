const { default: mongoose } = require('mongoose');
const Profile = require('../../../models/user/profile/profile.model');
const { uploadToCloudinary } = require('../../../utils/cloud/cloudinary.util');


exports.postProfile = async (req, res) => {
    try {

        const { idUser, name,nameKeyUser,  active } = req.body;

        let photoUrl = null;


        if (req.file) {
            const uploadImage = await uploadToCloudinary(req.file.buffer, "profile");
            photoUrl = uploadImage.secure_url;

        }

        const newProfile = await Profile.create({
            user: idUser,
            name: name,
            nameKeyUser: nameKeyUser,
            photo: photoUrl,
            active: active
        });

        res.status(201).json({ status: 201, message: "Perfil creado correctamente", data: newProfile });


    } catch (error) {
        return res.status(500).json({ status: 500, message: "Hubo un error" + error });
    }
}


exports.getByIdProfile = async (req, res) => {
    try {

        const { id } = req.params;

        if (!mongoose.Types.ObjectId.isValid(id)) {
            return res.status(400).json({ status: 400, message: "Este es un ID invalido." });
        }

        const profile = await Profile.findById(id);

        if (!profile) {
            return res.status(404).json({ status: 404, message: "Perfil no encontrado." });
        }

        return res.status(200).json({ status: 200, message: "OK", data: profile });


    } catch (error) {
        return res.status(500).json({ status: 500, message: "Hubo un error" + error });
    }
}