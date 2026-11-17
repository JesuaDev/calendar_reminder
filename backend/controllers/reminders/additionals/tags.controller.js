const tagsModel = require("../../../models/reminders/tags.model");


exports.postTag =  async (req, res) => {

    try{
        const {name, description, ilustration, color} = req.body; 

        const newTag = await tagsModel.create({
            name: name, 
            description: description,
            ilustration: ilustration,
            color: color
        }); 

        return res.status(201).json({status:201, message: "La categoria fue creada correctamente", data: newTag}); 



    }catch(err){
        return res.status(500).json({status:500, message: "Hubo un error en el servidor."})
    }

}