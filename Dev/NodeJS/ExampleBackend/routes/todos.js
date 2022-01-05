/** routes/todos */

const router = require('express-promise-router')();

const { getAllTodos, deleteAllTodos, getTodoById, deleteTodoById, updateTodoById, insertTodo } = require('../controllers/todos')

router
    .route('/todos')
    .post(insertTodo)
    .get(getAllTodos)
    .delete(deleteAllTodos)

router
    .route('/todos/:id')
    .get(getTodoById)
    .delete(deleteTodoById)
    .put(updateTodoById)

module.exports = router;
