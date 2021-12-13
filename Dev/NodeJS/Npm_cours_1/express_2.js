var express = require("express");

var app = express();

app.get("/", (req, res) => {
    res.writeHead(200, { "Content-Type" : "text/html" });
    res.end("<h1> Page d'accueil </h1>");
});

// à la mano
// app.get("/p2", (req, res) => {
//     res.writeHead(200, { "Content-Type" : "text/html" });
//     res.end("<h1> Page 1 </h1>");
// });

// app.get("/p3", (req, res) => {
//     res.writeHead(200, { "Content-Type" : "text/html" });
//     res.end("<h1> Page 1 </h1>");
// })

app.get("/page/:numPage/", (req, res) => {
    var page = req.params.numPage;
    res.writeHead(200, { "Content-Type" : "text/html" });
    res.end("<h1> Page " + page + " </h1>"); 
})

app.listen(3000);