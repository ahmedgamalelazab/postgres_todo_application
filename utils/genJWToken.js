const jwt = require("jsonwebtoken");

const genJWToken = async function (user){
    let token = null ; // init token 
    try{
        token = await jwt.sign({user_id : user.user_id} , process.env.USERJSWTOKEN);
        if(!token){
            return undefined;
        }
        return token;
    }catch(error){
        console.log(error);
        return undefined;
    }

    
}

module.exports = genJWToken;