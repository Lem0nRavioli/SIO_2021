//J'importe la librairie events
const events = require("events");
//Je crée mon objet qui va me permettre d'émettre un événement
const eventEmitter = new events.EventEmitter();
//Je vais créer un évènement connection
eventEmitter.on("connection", () => {

    console.log("Je suis connecté !");
});

eventEmitter.on("attempt", () => {
    console.log("Je tente de me connecter");
});
//Je lance manuellement l'évènement connection

eventEmitter.emit("attempt");

setTimeout(() => {
    eventEmitter.emit("connection");
}, 3000);