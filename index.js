require('dotenv').config({path : './config.env'});

const express = require('express');

const app = express();


app.use(express.json());
app.use("/app/api/todo",require("./routes/auth"));
app.use("/app/api/todo",require("./routes/todos"));


const PORT  = process.env.PORT;

app.listen(PORT , ()=>console.log(`listening on port : ${PORT}`));