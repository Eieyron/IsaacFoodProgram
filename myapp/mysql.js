// mysql.js

var mysql = require('mysql');

var connection = mysql.createPool({
    host:'localhost',
    user:'root',
    password:'airken1399',
    database:'ifpms'
});

module.exports = connection;