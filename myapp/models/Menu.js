// Meal.js

var mysql = require('../mysql');

var Menu = {

    viewAllMenu: function(callback){
        return mysql.query('call viewAllMenu();', callback);
    },
    viewMenuByID: function(id, callback){
        return mysql.query('call viewMenuByID(?);',[id], callback);
    },
    addMenu: function(menu, callback){
        return mysql.query('call addMeal(?);', [menu.week_no], callback);
    },

    viewAllMenuAvoids: function(id, callback){
        return mysql.query('call viewAllMenuAvoids(?)', [id], callback);
    },
    addMenuAvoid: function(id, menuavoid, callback){
        return mysql.query('call addMenuAvoid(?,?)', [id, menuavoid.index], callback);
    },
    deleteMenuAvoid: function(id, callback){
        return mysql.query('call deleteMenuAvoid(?,?)', [id], callback);
    },

    viewAllMenuMeals: function(id, callback){
        return mysql.query('call viewAllMenuMeals(?)', [id], callback);
    },
    addMenuMeal: function(id, menumeal, callback){
        return mysql.query('call addMenuMeal(?,?,?)', [id, menumeal.meal_id, menumeal.persons], callback);
    },
    deleteMenuMeal: function(id, callback){
        return mysql.query('call deleteMenuMeal(?)', [id], callback);
    },
    updateIngredientAmount: function(id, ingredient_connection, callback){
        return mysql.query('call updateIngredientAmount(?,?,?)', [id, ingredient_connection.id, ingredient_connection.amount], callback);
    }
};

module.exports = Meal;