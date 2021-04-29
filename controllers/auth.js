const pool = require("../config/db");
const bcrypt = require("bcrypt");
const {
    listen
} = require("../routes/todos");
const genJWToken = require("../utils/genJWToken");

//TODO HANDLE THE  register request


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
            userName : user.rows[0].userName,
            userEmail : user.rows[0].userEmail,
        },
        accessToken : token
    });

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

    res.send("hello from forgetPassword path ");

}


//TODO HANDLE THE   reset password request

exports.resetPassword = async (req, res, next) => {

    res.send("hello from reset password path ");

}