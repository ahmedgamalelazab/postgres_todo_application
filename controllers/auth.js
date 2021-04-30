const pool = require("../config/db");
const bcrypt = require("bcrypt");
const genJWToken = require("../utils/genJWToken");
const genResetToken = require("../utils/genResetToken");
const sendEmail = require("../utils/sendEmail");
const crypto = require("crypto");
const {genVerifyToken} = require("../utils/genVerifyToken");

//TODO HANDLE THE  register request

//VERSION 1.1 register
exports.register = async (req, res, next) => {

    const {
        userName,
        userEmail
    } = req.body;
    let {
        userPassword
    } = req.body;

    if (!userName || !userEmail || !userPassword) {
        return res.status(400).json({
            message: 'Bad request'
        });         
    }

    let user = await pool.query('select * from "public"."user" where "userEmail" = $1', [userEmail]);

    if (user.rows.length > 0) {
        return res.status(400).json({
            message: 'This email had registered already !'
        });
    }

    const salt = await bcrypt.genSalt(15);

    userPassword = await bcrypt.hash(userPassword, salt);

    //send verify token to user and wait for verifying it 

    const [OriginalToken , cryptToken , tokenExpires , isVerified] = await genVerifyToken();
    // console.log(OriginalToken , cryptToken);
    const verifyUrl =`http://localhost:3000/app/api/todo/verifyUser/${OriginalToken}`;

    const message = `
    <h1>Verify your account by following the instructions </h1>
    <p1>pleas follow the link to verify your account</p1>
    <a href = ${verifyUrl}>${verifyUrl}</a>
`   
   

    try{
        const info = await sendEmail({
            to : userEmail,
            subject: `Verify new Account`,
            text : message
        })
        //if everything ok !
        user = await pool.query('INSERT INTO "public"."user" ( "userName", "userEmail", "userPassword", "verify_token", "is_verified", "verify_token_expires") VALUES ( $1, $2, $3, $4, $5, $6 ) RETURNING *;', [userName, userEmail, userPassword ,cryptToken, isVerified ,Math.round(tokenExpires / 1000)]);
        
        res.status(201).json({
            success : true,
            user : user.rows[0],
            emailSentInfo : info
        })
        
    }catch(error){
        return res.status(500).json({ message: 'SERVER FAIL TO SEND VERIFY email message' , error : error });
    }
    
   
    /*
    const token = await genJWToken(user.rows[0]);
    if (!token) {
        return res.status(500).json({
            message: 'FATAL ERROR'
        });
    }

    if (!user) {
        return res.status(500).json({
            message: 'SERVER ERROR'
        });
    }
    return res.json({
        success: true,
        data: {
            userName: user.rows[0].userName,
            userEmail: user.rows[0].userEmail,
        },
        accessToken: token
    });
   */
}

/*
exports.register = async (req, res, next) => {

    const {
        userName,
        userEmail
    } = req.body;
    let {
        userPassword
    } = req.body;

    if (!userName || !userEmail || !userPassword) {
        return res.status(400).json({
            message: 'Bad request'
        });         
    }

    let user = await pool.query('select * from "public"."user" where "userEmail" = $1', [userEmail]);

    if (user.rows.length > 0) {
        return res.status(400).json({
            message: 'This email had registered already !'
        });
    }

    const salt = await bcrypt.genSalt(15);

    userPassword = await bcrypt.hash(userPassword, salt);

    user = await pool.query('INSERT INTO "public"."user" ( "userName", "userEmail", "userPassword")  VALUES ( $1, $2, $3 ) RETURNING *;', [userName, userEmail, userPassword]);

    const token = await genJWToken(user.rows[0]);
    if (!token) {
        return res.status(500).json({
            message: 'FATAL ERROR'
        });
    }

    if (!user) {
        return res.status(500).json({
            message: 'SERVER ERROR'
        });
    }
    return res.json({
        success: true,
        data: {
            userName: user.rows[0].userName,
            userEmail: user.rows[0].userEmail,
        },
        accessToken: token
    });

}
*/


//TODO handle the verify account process here 

exports.verifyAccount = async (req ,res , next)=>{
    //in params expected to receive token Origin token = > crypt it using the same hash and search with it for someone in data base 
    
    const originToken = req.params.verifyToken;

    let cryptTokenToSearch = crypto.
    createHash("sha256")
    .update(originToken)
    .digest("hex");

    //select user first 
    let user = await pool.query('select * from "public"."user" where "verify_token" = $1', [cryptTokenToSearch]);
    
    if(!user || user.rows.length === 0){
        return res.status(500).json({ message: 'server error' });
    }

    //update user 

    user = await pool.query('UPDATE "public"."user" SET"verify_token" = $1,"is_verified" = $2,"verify_token_expires" = $3 RETURNING * ;',[null , true, null]);

    // res.json({user : user.rows[0]})

    if(user.rows[0].is_verified === true){
        return res.json({ message: 'Thanks for verifying your account enjoy the service' });
    }else{
        return res.status(500).json({ message: 'failed to verifying you !' });
    }


}


//TODO HANDLE THE   login request


exports.login = async (req, res, next) => {

    const {
        userEmail,
        userPassword
    } = req.body;

    if (!userEmail || !userPassword) {
        return res.status(400).json({
            message: 'BAD REQUEST'
        });
    }

    const user = await pool.query('select * from "public"."user" where "userEmail" = $1', [userEmail]);

    if (user.rows.length == 0) {
        return res.status(400).json({
            message: 'Invalid userEmail or userPassword '
        });
    }

    //this is simple shape of code .. to refine this code simply u can wrap all of this logic in function and so on , in productive projects i wrap every thing in functions
    const userCryptPassword = user.rows[0].userPassword;

    const isMatch = await bcrypt.compare(userPassword, userCryptPassword);

    if (isMatch) {
        //in sql the representation of the object should be in this form user.rows[0]
        const token = await genJWToken(user.rows[0]);
        if (!token) {
            return res.status(500).json({
                message: 'FATAL ERROR'
            });
        }
        return res.status(200).json({
            success: true,
            userName: user.rows[0].userName,
            userEmail: user.rows[0].userEmail,
            accessToken: token
        });
    } else {
        return res.status(400).json({
            message: 'Invalid userEmail or userPassword'
        });
    }

}



//TODO HANDLE THE   forget password request


exports.forgotPassword = async (req, res, next) => {

    const {
        userEmail
    } = req.body;

    let user = await pool.query('select * from "public"."user" where "userEmail" = $1', [userEmail]);

    //if user not found he has to register in the application to use the forget password service
    if (user.rows.length === 0) {
        return res.status(400).json({
            message: 'you have to register first to use this future'
        });
    }

    //if found we have to update that user and provide a resetToken and provide a resetExpires

    const resetToken = genResetToken();

    const  [resetTokenOrigin , resetTokenHashed , resetTokenExpires] = resetToken;

    //    return res.json({token : resetTokenOrigin , hashedToken : resetTokenHashed , resetTokenExpires : resetTokenExpires});

    //updating the email that request a reset token 

    user = await pool.query('UPDATE "public"."user" SET "user_reset_token" = $1,"user_reset_token_expires" = $2 RETURNING *;',[resetTokenHashed ,Math.round(resetTokenExpires / 1000)]);

    // return res.json({userEmail : user.rows[0].userEmail , userResetToken : user.rows[0].user_reset_token , userTokenExpires : user.rows[0].user_reset_token_expires});

    const resetUrl = `http://localhost:3000/app/api/todo/resetPassword/${resetTokenOrigin}`;

    const text  = `
        <h1>you have request to reset your password due to forget it</h1>
        <p1>pleas follow the link to reset your password</p1>
        <a href = ${resetUrl}>${resetUrl}</a>
    `
    try{
        const info = await sendEmail({
            to : user.rows[0].userEmail,
            subject : `forget Password request`,
            text : text
        });

        return res.json({ success: true  , message : info});
    }catch(error){
        return res.status(400).json({ message: 'failed to send the email to reset the user Password' });
    }


}


//TODO HANDLE THE   reset password request

exports.resetPassword = async (req, res, next) => {

    let {userNewPassword} = req.body;
    const {resetPasswordToken} = req.params;

    if(!userNewPassword || ! resetPasswordToken){
        return res.status(400).json({ message: 'BAD REQUEST' });
    }

    //FIRST lets work with the token 

    const cryptPassword = crypto
    .createHash("sha256")
    .update(resetPasswordToken)
    .digest("hex");

    let user = await pool.query('select * from "public"."user" where "user_reset_token" = $1', [cryptPassword]);

    // if no match within the tokens that's mean we have to refuse it 
    if(!user){
        return res.status(400).json({ message: 'INVALID TOKEN' });
    }
    // if also the timestamp recorded on the model is less than the time.now that's mean it's invalid token and he has to ask for new one
    if(!user.rows[0]){
        return res.status(400).json({ message: 'INVALID TOKEN' });
    }

    if(user.rows[0].user_reset_token_expires < Math.round(Date.now()/1000)){
        return res.status(400).json({ message: 'INVALID TOKEN' });
    }

    // if all are ok 

    const salt = await bcrypt.genSalt(15);

    userNewPassword = await bcrypt.hash(userNewPassword, salt);

    user = await pool.query('UPDATE "public"."user" SET"userPassword" = $1,"user_reset_token" = $2,"user_reset_token_expires" = $3 RETURNING *;',[userNewPassword ,null , null]);

    if(!user){
        return res.status(400).json({ message: 'error during resetting your password !' });
    }


    return res.json({ success : true , userEmail : user.rows[0].userEmail ,passwordReset : true });

    // return res.json({userNewPassword : userNewPassword, resetPasswordToken : resetPasswordToken});

}