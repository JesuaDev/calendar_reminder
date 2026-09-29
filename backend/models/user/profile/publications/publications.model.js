const mongoose = require('mongoose');

const minNumber = 1000;
const maxNumber = 90000;

const publicationSchema = new mongoose.Schema({
    profile: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Profile",
        required: true,
    },
    subTitle: { type: String, required: false },
    media: [String],
    description: { type: String, required: false },
    commentCount: { type: Number, required: false },
    likes: { type: Number, default: () => Math.floor(minNumber + Math.random * maxNumber) },
    share: {
        type: Number, default: () => Math.floor(minNumber + Math.random * maxNumber
        )
    }
});

module.exports = mongoose.model("Publication", publicationSchema);