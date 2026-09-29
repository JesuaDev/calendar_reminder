const mongoose = require('mongoose'); 

const commentSchema = new mongoose.Schema({
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
    comment: {type:String, required: true, trim: true, maxlength: 500}, 
}, {timestamps: true}); 


module.exports = mongoose.model("Comment", commentSchema); 