const mongoose = require('mongoose');


const userSchema = new mongoose.Schema({
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },
}, { timestamps: true });

userSchema.virtual("profile", {
    ref: "Profile",
    localField: "_id",
    foreignField: "user",
    justOne: true
});

userSchema.set("toJSON", { virtuals: true });
userSchema.set("toObject", { virtuals: true });


module.exports = mongoose.model("User", userSchema);

