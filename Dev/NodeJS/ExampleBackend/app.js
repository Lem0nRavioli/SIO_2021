require('dotenv').config({ path: `./config/${process.env.NODE_ENV}.env` })

const express = require('express');
const cors = require('cors');

const app = express();

//middleware
app.use(express.json());
app.use(cors());

app.get('/api', ( _ , res) => {
    res.status(200).json({ success: "Todos API v1" });
});

const todosRoute = require('./routes/todos');
app.use('/api', todosRoute);

app.listen(process.env.PORT, () => {
    console.log(`Server listening on port ${process.env.PORT}`);
});