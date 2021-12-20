// const controllers = require('./controllers/todos');
// console.log(controllers.getAllTodos);
// const { getAllTodos } = require('./controllers/todos');
// console.log(getAllTodos);

const express = require("express");
const app = express();
app.use(express.json());

// route d'accueil
app.get('/api', (req, res) => {
    return res.status(200).json({ success: "Bienvenu sur l'API du 3ième cours node"});
})

const todosRoute = require('./routes/todos');
// adding '/api' avant les routes déclarées dans le todosRoute
app.use('/api', todosRoute);

// --------------- LAUNCH SERVER --------------- //
const PORT = 3000; // definis le port d ecoute
app.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}`);
});