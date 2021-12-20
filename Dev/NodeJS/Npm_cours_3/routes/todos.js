const router = require('express-promise-router')();

const { getAllTasks, addTask, getTask, editTask, deleteTask } = require('../controllers/todos');

// show all todos
router
    .route ('/tasks')
    .get(getAllTasks);
// add task
router
    .route('/addTask')
    .post(addTask);
// display task :numtask
router
    .route('/task/:numtask')
    .get(getTask);
// edit task :numtask
router
    .route('/task/edit/:numtask')
    .put(editTask);
// delete task :numtask
router
    .route('/task/delete/:numtask')
    .delete(deleteTask);

module.exports = router;