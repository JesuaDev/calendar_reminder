const Like = require('../../../../models/user/profile/publications/likes.model');


exports.postLikes = async (req, res) => {
    try {

        const { idPublication, idProfile, like } = req.body;

        const newLike = await Like.create({
            publication:idPublication, 
            profile:idProfile, 
            like: like
        });

        res.status(201).json({ status: 201, message: "Like subido correctamente", data:  newLike });


    } catch (error) {
        return res.status(500).json({ status: 500, message: "Hubo un error" + error });
    }
}