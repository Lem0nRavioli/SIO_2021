const http = require("http");
const fs = require("fs"); // File System

const server = http.createServer((req, res) => {
    fs.readFile('index.html', 'utf-8', (error, content) => {
        console.log(error);
        if (error) {
            res.writeHead(500, { "Content-Type": "application/json" });
            // res.end(`erreur: ${error.message}`);
            res.end(JSON.stringify(error));
        } else {
            res.writeHead(200, { "Content-Type": "text/html" });
            res.end(content);
        }
    })
});


server.listen(3000);