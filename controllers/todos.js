const pool = require("../config/db");


//TODO handle  get todo request 

exports.getAllTodo = async (req, res, next) => {

    const response = await pool.query(`
        SELECT * FROM todo;
    `);

    if (response) {
        return res.status(200).json({
            success: true,
            data: response.rows
        });
    } else {
        return res.status(401).json({
            error: true,
            message: "no todo found !"
        });
    }

}


//TODO handle  create todo   request 

exports.createTodo = async (req, res, next) => {

    const {
        describtion
    } = req.body;

    const response = await pool.query("INSERT INTO todo(describtion) VALUES ($1) RETURNING *", [describtion]);

    if (response) {
        return res.status(201).json({
            success: true,
            data: response.rows
        });
    } else {
        return res.status(500).json({
            message: 'Internal server error'
        });
    }

}


//TODO handle  update todo  request 

exports.updateTodo = async (req, res, next) => {

    const todo_id = req.params.id;
    const describtion = req.body.describtion;


    try {
        const response = await pool.query("UPDATE todo SET describtion = $1 WHERE todo_id = $2 RETURNING *", [describtion, todo_id]);
        if (response) {
            res.status(201).json({
                success: true,
                data: response.rows
            })
        } else {
            return res.status(500).json({
                message: 'error during updating data '
            });
        }

    } catch (error) {

        return res.status(400).json({
            message: 'BAD REQUEST',
            error: error
        });
    }


}



//TODO handle  delete todo  request 

exports.deleteTodo = async (req, res, next) => {

    //TODO use transaction to delete everything from the table and reset the counting 
    /**
   * BEGIN;
    DELETE FROM todo;
    ALTER SEQUENCE "public"."todo_todo_id_seq" RESTART 1
    COMMIT;
   */

  try {
    const response = await pool.query(`
    BEGIN;
    DELETE FROM todo;
    ALTER SEQUENCE todo_todo_id_seq RESTART 1;
    COMMIT;
`);
    if(response){
        return res.json({ success: true , message : "all items has been deleted !"});
    }else{
        return res.status(500).json({ message: 'SERVER ERROR !' });
    }
  } catch (error) {
    return res.status(400).json({ message: 'BAD REQUEST' });
  }

   
}

//TODO handle  delete todo specific item  request 


exports.deleteTodoSpecific = async (req, res, next) => {

    const todo_id = req.params.todo_id;

    if(!todo_id){
        return res.status(400).json({ message: 'BAD REQUEST'});
    }


  try {

    const todoToDelete = await pool.query("  SELECT * FROM todo WHERE todo_id = $1" ,[todo_id]);
    //that's mean the req id is removed already or not recorded in the table 
    if(todoToDelete.rows.length === 0){
        return res.status(400).json({ message: 'ITEM NOT FOUND' });
    }

    const response = await pool.query("  DELETE FROM todo WHERE todo_id = $1" ,[todo_id]);

   

    if(response && todoToDelete){
        return res.json({ success: true , itemDeleted : todoToDelete.rows});
    }else{
        return res.status(500).json({ message: 'SERVER ERROR !' });
    }
  } catch (error) {
    return res.status(400).json({ message: 'BAD REQUEST' });
  }

   
}
