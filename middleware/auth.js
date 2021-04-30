const pool = require("../config/db");
//auth here not meaning authentication but meaning authorization 
const jwt = require("jsonwebtoken");


exports.auth = async function (req, res, next) {

    const token = req.headers["x-auth-token"];

    if (!token) {
        return res.status(400).json({
            message: 'login to get access'
        });
    }

    try {

        const decode = await jwt.verify(token, process.env.USERJSWTOKEN);

        const user = await pool.query('select * from "public"."user" where "user_id" = $1', [decode.user_id]);

        if (!user) {
            return res.status(400).json({
                message: 'PROCESS FAILED'
            });
        }

        req.user = user;

        next();

    } catch (error) {

        return res.status(400).json({
            message: 'INVALID TOKEN'
        });
    }




}