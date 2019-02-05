const connection = require('../database')

module.exports = {
    viewAllIngredients: function(callback){
        return connection.query('SELECT * FROM ingredients', callback)
    },
    viewIngredient: function(ingredient_name, callback){
        return connection.query('SELECT * FROM ingredients WHERE ingredient_name = ?', ingredient_name, callback)
    },
    addIngredient: function(ingredient, callback){
        return connection.query('INSERT INTO ingredients SET ?', ingredient, callback)
    },
    updateIngredient: function(ingredient, callback){
        return connection.query('UPDATE ingredients SET ingredient_name = ?, ingredient_type = ?, cost = ?, unit = ? WHERE ingredient_id = ?', [ingredient.ingredient_name, ingredient.ingredient_type, ingredient.cost, ingredient.unit, ingredient.ingredient_id], callback)
    },
    deleteIngredient: function(ingredient_id, callback){
        return connection.query('DELETE FROM ingredients WHERE ingredient_id = ?', ingredient_id, callback)
    }
}
