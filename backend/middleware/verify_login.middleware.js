

exports.verifyLogin = (req, res, next) => {
    try {
        const token = req.headers["authorization"]; 
    } catch (err) {
        return res.status(500).json({ status: 500, message: `Hubo un error ${err}` })
    }
}