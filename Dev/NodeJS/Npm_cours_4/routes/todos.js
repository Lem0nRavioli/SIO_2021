const router = require('express-promise-router')();

const { getAllTasks, addTask, getTask, editTask, deleteTask, deleteAll } = require('../controllers/todos');

// show all todos
router
    .route ('/tasks')
    .get(getAllTasks)   // return all task
    .post(addTask)     // adding a task
    .delete(deleteAll);

router
    .route('/task/:numtask')
    .get(getTask)       // get task with :numtask id
    .put(editTask)      // edit task with :numtask id
    .delete(deleteTask);// delete task with :numtask id


module.exports = router;