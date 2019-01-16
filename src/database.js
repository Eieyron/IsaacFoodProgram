'use strict'

const mysql = require('mysql');

// connection to database
const connection = mysql.createConnection({
    host :'localhost',
    user :'dom',
    password :'Dom_1234',
    database :'ifpms'
});

// for checking database connection
connection.connect( (err) => {
    if (!err)
      console.log('Connected to the database!')
    else 
      console.log('Error connecting to the database')
});

connection.query('USE ifpms')
module.exports = connection;