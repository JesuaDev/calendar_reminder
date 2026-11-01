
const jwt = require('jsonwebtoken'); 

exports.verifyLogin = (req, res, next) => {
    try {
        const accessToken = req.headers["authorization"]; 

        if(!accessToken){
            return res.status(401).json({status:401, message:"Acceso denegado: No se a recibido ningun token."}); 
        }

        const tokenClean = accessToken.split(' ')[1]; 
        const decoded = jwt.verify(tokenClean, process.env.SECRET_TOKEN); 

        req.user = decoded; 
        next(); 
    

    } catch (err) {
        return res.status(500).json({ status: 500, message: `Hubo un error ${err}` })
    }
}