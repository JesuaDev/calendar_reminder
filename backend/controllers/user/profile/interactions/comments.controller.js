const Comment = require('../../../../models/user/profile/publications/comments.model');



exports.commentPost = async (req, res) => {
    try {

        const { idPublication, idProfile, comment } = req.body;

        const newComment = await Comment.create(
            {
                publication: idPublication, 
                profile: idProfile, 
                comment: comment
            }
        );

        return res.status(201).json({status: 201, message: "Comentario subido correctamente", data: newComment})

    } catch (error) {
        return res.status(500).json({ status: 500, message: "Hubo un error" });
    }
}