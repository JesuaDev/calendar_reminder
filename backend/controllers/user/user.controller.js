
const User = require('../../models/user/user.model'); 
const bcrypt = require('bcryptjs');


exports.postUser = async (req, res) => {
    try{
        const SALT_HASH = 12; 
        const {email, password} = req.body;     
        const hashedPassword = bcrypt.hashSync(password, SALT_HASH);


        const newUser = await User.create({
            email: email,
            password:hashedPassword
        }); 

        res.status(201).json({status:201, message:"Usuario creado correctamente", data: newUser}); 


    }catch(err){
        return res.status(500).json({status:500, message: "Hubo un error"}); 
    }
}