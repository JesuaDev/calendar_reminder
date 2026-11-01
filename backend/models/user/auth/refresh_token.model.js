const mongoose = require('mongoose');

 

const refreshTokenSchema = new mongoose.Schema({
    user: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true, index: true },
    tokenHash: { type: String, unique: true, required: true },
    deviceId: { type: String, required: true },
    expiresAt: { type: Date, default: ()=> new Date(Date.now() + 30 * 24 * 60 * 60 * 1000) },
    revoked: { type: Boolean, default: false },
    replaceBy: { type: String, required: true }

}, { timestamps: true });


refreshTokenSchema.index({ expiresAt: 1 }, { expireAfterSeconds: 0 });

module.exports = mongoose.model("RefreshToken", refreshTokenSchema);