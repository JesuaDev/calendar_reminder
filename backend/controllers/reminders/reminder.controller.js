
const Reminder = require('../../models/reminders/reminder.model');

exports.postNewReminder = async (req, res) => {
    try {
        const { idUser, reminder, description, dateInit, dateEnd, hourInit, hourEnd, tags } = req.body;

        const newReminder = await Reminder.create({});



    } catch (error) {
        return res.status(500).json({ status: 500, message: "Hubo un error" });
    }
}