/* Fake database */

const todos = [
    { id: 1, texte: "premiere tache" },  
    { id: 2, texte: "seconde tache" },
    { id: 3, texte: "troisieme tache" }
]

/** controllers/todos */
const pool = require('../config/database');
const { call } = require('../utils');

module.exports = {
    getAllTodos: async (_, res) => {
        await call(res, async (connexion) => {
            const result = await connexion.query("CALL selectAllTodos()");
            return res.status(200).json({ success: result[0] })
        });
    },
    deleteAllTodos: async (_, res) => {
        await call (res, async (connexion) => {
            const result = await connexion.query("CALL deleteAllTodos()");
            return res.status(200).json({ success: result })
        })
        // let connexion;
        // try {
        //     connexion = await pool.getConnection()
        //     const result = await pool.query("CALL deleteAllTodos()");
        //     return res.status(200).json({ success: result });
        // } catch (error) {
        //     return res.status(400).json({ error: error.message });
        // } finally {
        //     if (connexion) connexion.end();
        // }
    },
    getTodoById: async (req, res) => {
        const { id } = req.params; 

        /** eventuel gestion d'erreur ici  */

        await call(res, async (connexion) => {
            const result = await connexion.query("CALL selectTodoById(?)", [id]);
            return res.status(200).json({ success: result[0][0] });
        })
    },
    deleteTodoById: async (req, res) => {
        const { id } = req.params; 

        await call(res, async (connexion) => {
            const result = await connexion.query("CALL deleteTodoById(?)", [id]);
            return res.status(200).json({ success: result });
        })
    },
    updateTodoById: async (req, res) => {
        const { id } = req.params;
        const { texte } = req.body;

        await call(res, async (connexion) => {
            const result = await connexion.query("CALL updateTodoById(?, ?)", [id, texte]);
            return res.status(200).json({ success: result });
        })

    },
    insertTodo: async (req, res) => {
        const { texte } = req.body;
        
        if (!texte.trim()) {
            return res.status(400).json({ error: 'Le champs texte ne peut être vide.' });
        }

       await call(res, async (connexion) => {
            // const result = await connexion.query('INSERT INTO todo (texte) VALUES ("'+ texte +'")');
            // const result = await connexion.query(`INSERT INTO todo (texte) VALUES ('${texte}')`);
            
            // parametres positionnels
            // const result = await connexion.query(`INSERT INTO todo (texte) VALUES (?)`, [texte]);
            const result = await connexion.query(`CALL insertTodos(?)`, [texte]);
            
            // parametres  nommés
            // const result = await connexion.query(`INSERT INTO todo (texte) VALUES (:texte)`, { texte });
            // const result = await connexion.query(`CALL insertTodos(:texte)`, { texte });
            return res.status(200).json({ success: result });
       })
    }
};