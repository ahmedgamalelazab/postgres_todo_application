const pool = require("../config/db");
const bcrypt = require("bcrypt");
const { listen } = require("../routes/todos");

//TODO HANDLE THE  register request


exports.register = async(req , res , next)=>{

    const {userName , userEmail } = req.body;
    let {userPassword} = req.body;

    if(!userName || !userEmail || !userPassword){
        return res.status(400).json({ message: 'Bad request'});
    }

    let user = await pool.query('select * from "public"."user" where "userEmail" = $1',[userEmail]);

    if(user.rows.length > 0){
        return res.status(400).json({ message: 'This email had registered already !' });
    }

    const salt = await bcrypt.genSalt(15);

    userPassword = await bcrypt.hash(userPassword , salt);

    user = await pool.query('INSERT INTO "public"."user" ( "userName", "userEmail", "userPassword")  VALUES ( $1, $2, $3 ) RETURNING *;',[userName,userEmail,userPassword]);

    if(!user){
        return res.status(500).json({ message: 'SERVER ERROR' });
    }
    return res.json({success : true, data : user.rows});

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
