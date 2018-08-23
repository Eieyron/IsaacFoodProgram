// Meal.js

var mysql = require('../mysql');

var Meal = {
    viewAllMeals: function(callback){
        return mysql.query('call viewAllMeals();', callback);
    },
    viewMealByID: function(id, callback){
        return mysql.query('call viewMealByID(?);',[id], callback);
    },
    addMeal: function(meal, callback){
        return mysql.query('call addMeal(?,?,?,?);', [meal.name, meal.type, meal.time, meal.recipe], callback);
    },
    deleteMealByID: function(id, callback){
        return mysql.query('call deleteMealByID(?);', [id], callback);
    },
    updateMealByID: function(id, meal, callback){
        return mysql.query('call updateMealByID(?,?,?,?,?);', [id, meal.name, meal.type, meal.time, meal.recipe], callback);
    }
}

module.exports = Meal;