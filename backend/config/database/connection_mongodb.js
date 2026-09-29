require('dotenv').config();
const mongoose = require('mongoose');

const connection = async () => {
    try {
        const encodedPassword = encodeURIComponent(process.env.PASSWORD_DB);
        await mongoose.connect(`mongodb+srv://jesuaduron_db_user:${encodedPassword}@${process.env.HOST}/reminders_db?appName=calendarReminder`);
        console.log("se conectó correctamente a la base de datos");
    } catch (error) {
        console.log(error);
    }

}

module.exports = connection;

