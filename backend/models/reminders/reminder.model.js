const mongoose = require('mongoose');



const reminderSchema = new mongoose.Schema(
    {
        user: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "User",
            required: true,
            index: true,
        },

        reminder: { type: String, required: true },
        description: { type: String, trim: true, maxlength: 350 },
        dateHourInit: { type: Date, required: true },
        dateHourEnd: { type: Date },
        tags: [{ type: mongoose.Schema.Types.ObjectId, ref: "Tag" }]
    }, {timestamps: true}
);

module.exports = mongoose.model("Reminder", reminderSchema); 