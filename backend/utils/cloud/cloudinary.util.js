const cloudinary = require("../../config/cloud/cloudinary.config");



exports.uploadToCloudinary = (buffer, folder = " ") =>
    new Promise((resolve, reject) => {
        const stream = cloudinary.uploader.upload_stream({
            folder, resource_type: "auto",
            quality: "auto",
            fetch_format: "auto"
        },
            (error, result) => (error ? reject(error) : resolve(result))
        );

        stream.end(buffer);
    },
    );
