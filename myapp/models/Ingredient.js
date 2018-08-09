// Ingredient.js

var mysql = require('../mysql');

var Ingredient = {
    viewAllIngredients: function(callback){
        return mysql.query('call viewAllIngredients();', callback);
    },
    viewIngredientByID: function(id, callback){
        return mysql.query('call viewIngredientByID(?);',[id], callback);
    },
    addIngredient: function(ingredient, callback){
        return mysql.query('call addIngredient(?,?,?,?);', [ingredient.name, ingredient.type, ingredient.cost, ingredient.unit], callback);
    },
    deleteIngredientByID: function(id, callback){
        return mysql.query('call deleteIngredientByID(?);', [id], callback);
    },
    updateIngredientByID: function(id, ingredient, callback){
        return mysql.query('call updateIngredientByID(?,?,?,?,?);', [id, ingredient.name, ingredient.type, ingredient.cost, ingredient.unit], callback);
    }
}

module.exports = Ingredient;