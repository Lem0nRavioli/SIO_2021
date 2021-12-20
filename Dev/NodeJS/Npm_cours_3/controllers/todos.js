// const tab = [1,2,3,4,5];
// module.exports = tab;

// FAKE DATABASE //
const todos = [
    { id: 1, texte: "tache 1" },
    { id: 2, texte: "tache 2" },
    { id: 3, texte: "tache 3" }
]

// no task found at index
const noTaskFound = (res) => {
    res.status(400).json({ error: `Aucune tâche trouvée avec ce numéro` });
}

const routes = {
    // display all todos
    getAllTasks: (req, res) => {
        return res.status(200).json({ success: "Voici la liste des tâches", todos: todos });
    },

    // add todo
    addTask: (req, res) => {
        const { id, texte } = req.body;
        todos.push({ id: id, texte: texte });
        return res.status(200).json({ success: `${todos[todos.length - 1].texte} has been added` });
    },

    // get todo at index :numtask - 1
    getTask: (req, res) => {
        const { numtask } = req.params;
        for (let i = 0; i < todos.length; i++) {
            if (todos[i].id == numtask) {
                return res.status(200).json({ success: `La tache numéro ${numtask} contient la tâche ${todos[i].texte}` });
            }
        }
        return noTaskFound(res);
    },

    // edit todo at index :numtask -1
    editTask: (req, res) => {
        const { numtask } = req.params;
        const { texte } = req.body;

        if (numtask > todos.length) {
            return noTaskFound(res);
        }

        const temp_text = todos[numtask - 1].texte;
        todos[numtask - 1].texte = texte;
        return res.status(200).json({ success: `Tâche <<${temp_text}>> modifiée en la tâche: <<${todos[numtask - 1].texte}>>` });
    },

    // delete todo at index :numtask -1
    deleteTask: (req, res) => {
        const { numtask } = req.params;

        if (numtask > todos.length) {
            return noTaskFound(res);
        }

        const temp_task = todos[numtask - 1];
        todos.splice(numtask - 1, 1);
        return res.status(200).json({ success: `Tâche numéro ${temp_task.id} contenant la description <<${temp_task.texte}>> a bien été supprimée`, todos: todos });
    }

};


module.exports = routes;

