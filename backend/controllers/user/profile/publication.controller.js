const Publication = require('../../../models/user/profile/publications/publications.model');

exports.postPublication = async (req, res) => {
    try {
        const {idProfile, subTitle,  media, description, commentCount, likes, share} = req.body; 

        const newPublication = await Publication.create(
            {
                profile: idProfile, 
                subTitle: subTitle, 
                media:media, 
                description: description, 
                commentCount: commentCount, 
                likes: likes, 
                share: share
            }
        ); 


        return res.status(201).json({status: 201, message: "Publicación", data: newPublication}); 


    } catch (error) {   
        return res.status(500).json({ status: 500, message: "Hubo un error" });
    }

}
