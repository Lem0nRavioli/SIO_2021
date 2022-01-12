const mariadb = require('mariadb');

// const pool = mariadb.createPool({
//     connectionLimit: 10,
//     host: process.env.HOST,
//     user: process.env.USER,
//     password: process.env.PASSWORD,
//     database: process.env.DATABASE,
//     port: process.env.DB_PORT
// })

const pool = mariadb.createPool({
    connectionLimit: 10,
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'todo_dev2',
    port: 3000
})

module.exports = pool;