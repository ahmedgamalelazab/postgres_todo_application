const express = require('express');
const {getAllTodo , createTodo , deleteTodo , updateTodo , deleteTodoSpecific} = require('../controllers/todos');
const router = express();
const {auth} = require("../middleware/auth");

router.route("/CreateTodo").post(auth,createTodo);


router.route("/All").get(auth,getAllTodo);


router.route("/UpdateTodo/:id").put(auth,updateTodo);


router.route("/DeleteTodo").delete(auth,deleteTodo);


router.route("/DeleteTodo/:todo_id").delete(auth,deleteTodoSpecific);




module.exports = router;