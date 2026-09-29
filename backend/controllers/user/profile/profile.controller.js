const Profile = require('../../../models/user/profile/profile.model'); 


exports.postProfile = async (req, res) => {
    try {
      
        const {idUser, name, nameKeyUser, photo, active } = req.body;
    
        const newProfile = await Profile.create({
            user: idUser,
            name:name, 
            nameKeyUser: nameKeyUser, 
            photo:photo, 
    
        });

        res.status(201).json({ status: 201, message: "Usuario creado correctamente", data: newProfile });


    } catch (error) {
        return res.status(500).json({ status: 500, message: "Hubo un error"+ error });
    }
}