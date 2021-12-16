/**------------------- SERVEUR EXPRESS ------------------------- */

// import express from "express";
const express = require("express");
const res = require("express/lib/response");
const app = express(); // créer un objet express -- gestion du routing

/**------------------- FIN SERVEUR EXPRESS ------------------------- */

app.use(express.json()); // autparse body to json
const todos = [
    { id: 1, texte: "tache 1"},
    { id: 2, texte: "tache 2"},
    { id: 3, texte: "tache 3"}
]

const noTaskFound = (res) => {
    res.status(400).json({ error: `Aucune tâche trouvée avec ce numéro`});
}

// affiche toutes les tâches
app.get('/', (req, res) => {
    return res.status(200).json({ success: "Voici la liste des tâches", todos: todos });
});

// ajoute une nouvelle tache (temporaire vu que pas de sauvegarde)
app.post('/newdo', (req, res) => {
    const { id, texte } = req.body;
    console.log(id, texte);
    todos.push({id: id, texte: texte });
    return res.status(200).json({ success: `${todos[todos.length -1].texte} has been added`});
});

// Affiche la tâche numéro x
app.get('/task/:numtask', (req, res) => {
    const { numtask } = req.params;
    for (let i=0; i<todos.length; i++) {
        if (todos[i].id == numtask) {
            return res.status(200).json({ success: `La tache numéro ${numtask} contient la tâche ${todos[i].texte}`});
        }
    }
    // return res.status(400).json({ error: `Aucune tâche trouvée avec ce numéro`});
    return noTaskFound(res);
});

// edit la tâche numéro x
app.put('/task/edit/:numtask', (req, res) => {
    const { numtask } = req.params;
    const { texte } = req.body;

    if (numtask > todos.length ) {
        // return res.status(400).json({ error: `Aucune tâche trouvée avec ce numéro`});
        return noTaskFound(res);
    }

    const temp_text = todos[numtask - 1].texte;
    todos[numtask - 1].texte = texte;
    return res.status(200).json({ success: `Tâche <<${temp_text}>> modifiée en la tâche: <<${todos[numtask - 1].texte}>>`});

});

// delete la tâche numéro x
app.delete('/task/delete/:numtask', (req, res) => {
    const { numtask } = req.params;

    if (numtask > todos.length ) {
        // return res.status(400).json({ error: `Aucune tâche trouvée avec ce numéro`});
        return noTaskFound(res);
    }

    const temp_task = todos[numtask - 1];
    todos.splice(numtask - 1, 1);
    return res.status(200).json({ success: `Tâche numéro ${temp_task.id} contenant la description <<${temp_task.texte}>> a bien été supprimée`, todos: todos});
});


// --------------- CODE REFERENCE -------------------------- //

app.get('/bonjour/:prenom', (req, res) => {
    const { prenom } = req.params; // extraction params découpée
    // const prenom = req.params.prenom; // extraction params directe
    return res.status(200).json({ success: `Bonjour ${prenom}` });
});

app.post('/inscription', (req, res) => {
    const { username, email, password, password_repeat } = req.body;

    if (password != password_repeat) {
        return res.status(400).json({ error: `check les typos bouffon` }); // check if psw == psw_rpt, return 400 error if not
    }

    return res.status(200).json({ success: `${email} a bien été inscrit` }); // return if ok
});

// --------------- FIN CODE REFERENCE -------------------------- //


const PORT = 3000; // definis le port d ecoute
app.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}`);
});