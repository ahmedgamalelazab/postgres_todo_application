const {Pool} = require('pg');

const pool = new Pool({
    user : process.env.PSQLUSER,
    password : process.env.PSQLPASSWORD,
    host : process.env.PSQLHOST,
    database : process.env.PSQLDATABASE,
    port : process.env.PSQLPORT
})

module.exports = pool;