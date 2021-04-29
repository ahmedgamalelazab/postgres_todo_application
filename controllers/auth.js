const pool = require("../config/db");


//TODO HANDLE THE  register request


exports.register = async(req , res , next)=>{

    res.send("hello from register auth route");

}


//TODO HANDLE THE   login request


exports.login = async(req , res , next)=>{

    res.send("hello from login auth route");

}



//TODO HANDLE THE   forget password request


exports.forgotPassword = async(req , res , next)=>{

    res.send("hello from forgetPassword path ");

}


//TODO HANDLE THE   reset password request

exports.resetPassword = async(req , res , next)=>{

    res.send("hello from reset password path ");

}
