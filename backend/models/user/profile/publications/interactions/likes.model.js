const mongoose = require('mongoose');


const likesSchema = new mongoose.Schema(
    {
        publication: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Publication",
            required: true,
            index: true
        },
        profile: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Profile",
            required: true
        },

        isLike: {type: Boolean, default: false}
    }); 