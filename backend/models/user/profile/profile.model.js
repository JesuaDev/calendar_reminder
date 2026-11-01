
const mongoose = require('mongoose');

const profileSchema = new mongoose.Schema({
   user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
      unique: true
   },
   name: { type: String, required: true },
   nameKeyUser: { type: String, required: true, unique: true },
   photo: { type: String, required: false },
   active: { type: Boolean, default: false }


}, { timestamps: true });


module.exports = mongoose.model("Profile", profileSchema); 
