// mysql.js

var mysql = require('mysql');

var connection = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'ifpms'
});

connection.connect();

module.exports = connection;