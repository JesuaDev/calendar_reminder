
const Reminder = require('../../models/reminders/reminder.model');

exports.postNewReminder = async (req, res) => {
    try {
        const { idUser, reminder, description, dateInit, dateEnd, tags } = req.body;

        const newReminder = await Reminder.create({
            user: idUser,
            reminder: reminder,
            description: description,
            dateHourInit: dateInit,
            dateHourEnd: dateEnd,

            tags: tags
        });


        return res.status(201).json({ status: 201, message: "El recordatorio se creó correctamente.", data: newReminder });

    } catch (error) {
        return res.status(500).json({ status: 500, message: "Hubo un error en el servidor." });
    }
}



exports.getReminders = async (req, res) => {
    try {


        let hourInit = new Date();
        hourInit.setUTCHours(0, 0, 0, 0);

        let hourEnd = new Date();
        hourEnd.setUTCHours(12, 0, 0, 0);

        const todayReminders = await Reminder.find({
            $and: [
                {
                    dateHourInit: { $gte: hourInit },
                },
                { dateHourInit: { $lte: hourEnd } }
            ]

        });

        return res.status(200).json({ status: 200, message: "Recordatorios de hoy", data: todayReminders });

    } catch (error) {
        return res.status(500).json({ status: 500, message: "Hubo un error en el servidor." });
    }
}

