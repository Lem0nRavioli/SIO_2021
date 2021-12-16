// import express from "express";
const express = require("express");

const app = express(); // créer un objet express -- gestion du routing

app.use(express.json()); // autparse body to json


app.get('/', (req, res) => {
    return res.status(200).json({ success: "Bonjour, vous êtes sur l'API SIO SLAM" });
});


app.get('/bonjour/:prenom', (req, res) => {
    const { prenom } = req.params; // extraction params découpée
    // const prenom = req.params.prenom; // extraction params directe
    return res.status(200).json({ success: `Bonjour ${prenom}` });
});

app.post('/inscription', (req, res) => {
    const { username, email, password, password_repeat } = req.body;

    if (password != password_repeat) {
        return res.status(400).json({ error: `check les typos bouffon` });
    }

    return res.status(200).json({ success: `${email} a bien été inscrit` });
});


const PORT = 3000; // definis le port d ecoute
app.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}`);
});