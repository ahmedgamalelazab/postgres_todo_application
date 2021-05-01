const pool = require("../config/db");


//TODO handle  get todo request 

exports.getAllTodo = async (req, res, next) => {

    const {user_id} = req.user; // will work as a parent

    const response = await pool.query('SELECT * FROM "public"."todo" WHERE "user_id" = $1;',[user_id]);

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
//TODO handle each user insertion

exports.createTodo = async (req, res, next) => {

    // return res.send(req.user);
    const {user_id} = req.user; // will work as a parent
    
    const {
        describtion
    } = req.body;

    const response = await pool.query('INSERT INTO "public"."todo" ( "describtion", "user_id") VALUES ( $1, $2 ) RETURNING *;', [describtion , user_id]);

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

    const {user_id} = req.user;
    const todo_id = req.params.id;
    const describtion = req.body.describtion;


    try {
        const response = await pool.query('UPDATE "public"."todo" SET "describtion" = $1 WHERE "todo_id" = $2 AND "user_id" = $3 RETURNING *;', [describtion, todo_id,user_id]);
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

    const {user_id} = req.user;

  try {
    const response = await pool.query('DELETE FROM "public"."todo" WHERE "user_id" = $1;',[user_id]);
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

    const {user_id} = req.user;

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

    const response = await pool.query('DELETE FROM todo WHERE todo_id = $1 AND "user_id" = $2 ' ,[todo_id,user_id]);

   

    if(response && todoToDelete){
        return res.json({ success: true , itemDeleted : todoToDelete.rows});
    }else{
        return res.status(500).json({ message: 'SERVER ERROR !' });
    }
  } catch (error) {
    return res.status(400).json({ message: 'BAD REQUEST' });
  }

   
}
