
require('dotenv').config();
const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;
const  connection = require('./config/database/connection_mongodb')

const cors = require('cors');
const corsConfiguration = {
    origin: "*",
    methods: ["GET", "POST", "PUT", "DELETE"],
    allowedHeaders: ['Content-Type', 'Authorization'],
}

app.use(cors(corsConfiguration));
app.use(express.json());

connection(); 

const profileRouter = require('./routes/user/profile.router');
const userRouter = require('./routes/user/user.router');
const publicationRouter = require('./routes/user/publications/publications.router'); 
const authRouter = require('./routes/user/auth/auth.router')

app.use('/', authRouter); 
app.use('/', userRouter);
app.use('/', profileRouter);
app.use('/', publicationRouter);



app.listen(PORT, () => {
    console.log(`El servidor esta corriendo en http://localhost:${PORT}`);
})






