const pool = require('../config/database'); // import mariadb pool

// FAKE DATABASE //
// const todos = [
//     { id: 1, texte: "tache 1" },
//     { id: 2, texte: "tache 2" },
//     { id: 3, texte: "tache 3" }
// ]

// no task found at index
const noTaskFound = (res) => {
    res.status(400).json({ error: `Aucune tâche trouvée avec ce numéro` });
}

// send request to db specified in the call and return what the db feedback
const fetchDB = async (call) => {
    let connexion;
    try {
        connexion = await pool.getConnection();
        const result = await connexion.query(call);
        // const result = await connexion.query(`CALL createTask(?, ?)`, [id, texte]);
        return result;
    } catch (error) {
        return error.message;
    } finally {
        if (connexion) connexion.end();
    }
}

const controllers = {
    // display all todos
    getAllTasks: async (req, res) => {
        const result = await fetchDB('CALL getAllTasks()');
        return res.status(200).json({ success: "Voici la liste des tâches", tasks: result[0] });
    },

    // add todo
    addTask: async (req, res) => {
        const { id, texte } = req.body;
        const idValid = await fetchDB(`CALL getTask(${id})`);
        console.log(idValid);
        if (idValid[0].length == 0) {
            await fetchDB(`CALL addTask(${id}, ${JSON.stringify(texte)})`);
            const result = await fetchDB(`CALL getTask(${id})`);
            return res.status(200).json({ success: `${result[0][0].texte} has been added` });
        }
        return res.status(400).json({ error: `La tâche ${id} contient déjà ${idValid[0][0].texte}`});        
    },

    // get todo with id :numtask
    getTask: async (req, res) => {
        const { numtask } = req.params;
        const result = await fetchDB(`CALL getTask(${numtask})`);
        if (result[0].length > 0) {
            return res.status(200).json({ success: result[0] });
        }
        return noTaskFound(res);
    },

    // edit todo with id :numtask
    editTask: async (req, res) => {
        const { numtask } = req.params;
        const { texte } = req.body;
        
        const oldTask = await fetchDB(`CALL getTask(${numtask})`);
        if (oldTask[0].length > 0) {
            await fetchDB(`CALL editTask(${numtask}, ${JSON.stringify(texte)})`);
            const result = await fetchDB(`CALL getTask(${numtask})`);
            return res.status(200).json({ success: `Tâche <<${oldTask[0][0].texte}>> modifiée en la tâche: <<${result[0][0].texte}>>` });
        }
        return noTaskFound(res);        
    },

    // delete todo with id :numtask
    deleteTask: async (req, res) => {
        const { numtask } = req.params;
        const result = await fetchDB(`CALL getTask(${numtask})`);
        if (result[0].length > 0) {
            await fetchDB(`CALL deleteTask(${numtask})`);
            return res.status(200).json({ success: `Tâche numéro ${result[0][0].id} contenant la description <<${result[0][0].texte}>> a bien été supprimée`});
        }
        return noTaskFound(res);        
    },
    
    // delete all tasks
    deleteAll: async (req, res) => {
        await fetchDB(`CALL deleteAllTask()`);
        const result = await fetchDB('CALL getAllTasks()');
        if (result[0] != 0) {
            return res.status(400).json({ error: `The dev did a shit job with procedure and your table isn't cleared`});
        }
        return res.status(200).json({ success: `Table bien nettoyée !`});

    }
};


module.exports = controllers;

