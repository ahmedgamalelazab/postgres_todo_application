const crypto = require("crypto");


exports.genVerifyToken = async function(){
    //initial state for someone registered for the first time will be false 
    const isVerified = false;
    //this function will provide a secret token with a expire data 

    const verifyToken =  crypto.randomBytes(20).toString("hex"); // Origin token

    const cryptToken = crypto
    .createHash("sha256")
    .update(verifyToken)
    .digest("hex"); //crypt one

    const verifyExpiresIn = Date.now() + 60 *(60 *1000); //expires


    return [verifyToken , cryptToken , verifyExpiresIn ,isVerified]; // arr of process 

}