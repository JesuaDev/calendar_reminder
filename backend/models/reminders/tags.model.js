const mongoose = require('mongoose');


const tagsSchema = new mongoose.Schema({
    name: { type: String, required: true, unique: true },
    color: { type: String }
}, { timestamps: true });


module.exports = mongoose.model("Tag", tagsSchema); 
