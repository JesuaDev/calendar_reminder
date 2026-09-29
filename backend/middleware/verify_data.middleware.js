

exports.verifyFieldData = (fields = []) => {
    return (req, res, next) => {
        let missingField = [];

        for (const field of fields) {
            if (req.body[field] === undefined || req.body[field] === null || req.body[field] === "") {
                missingField.push(field);
            }

        }

        if (missingField.length > 0) return res.status(400).json({ status: 400, message: "Datos incompletos", incomplete: missingField });

        next();
    }
}