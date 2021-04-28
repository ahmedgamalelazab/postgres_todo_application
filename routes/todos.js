const express = require('express');
const {getAllTodo , createTodo , deleteTodo , updateTodo , deleteTodoSpecific} = require('../controllers/todos');
const router = express();


router.route("/CreateTodo").post(createTodo);


router.route("/All").get(getAllTodo);


router.route("/UpdateTodo/:id").put(updateTodo);


router.route("/DeleteTodo").delete(deleteTodo);


router.route("/DeleteTodo/:todo_id").delete(deleteTodoSpecific);




module.exports = router;