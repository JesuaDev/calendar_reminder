const Publication = require('../../../models/user/profile/publications/publications.model');
const { uploadToCloudinary } = require('../../../utils/cloud/cloudinary.util');

exports.postPublication = async (req, res) => {
    try {
        const { idProfile, subTitle, description, commentCount, likes, share } = req.body;

        let multimediaUrl = [];
        if (req.files && req.files.length > 0) {
            const allMultimedia = req.files.map(file => uploadToCloudinary(file.buffer, "publication"));

            multimediaUrl = Promise.all(allMultimedia);
        }


        const newPublication = await Publication.create(
            {
                profile: idProfile,
                subTitle: subTitle,
                media: multimediaUrl,
                description: description,
                commentCount: commentCount,
                likes: likes,
                share: share
            }
        );


        return res.status(201).json({ status: 201, message: "Publicación", data: newPublication });


    } catch (error) {
        return res.status(500).json({ status: 500, message: "Hubo un error" });
    }

}



exports.getPublications = async (req, res) => {
    
}