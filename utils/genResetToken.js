const crypto = require("crypto");

const genResetToken = function(){
    const resetToken =  crypto.randomBytes(20).toString("hex");

    //hashed one 
    const hashToken = crypto.
    createHash("sha256")
    .update(resetToken)
    .digest("hex");

    //expires in timestamp 
    const resetTokenExpires = Date.now() + 10 * (60 * 1000);
   
    return [resetToken , hashToken , resetTokenExpires];
}

module.exports = genResetToken;