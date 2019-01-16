const IndexController = require('./controllers/IndexController')
const IngredientController = require('./controllers/IngredientController')
const MealController = require('./controllers/MealController')
const UserController = require('./controllers/UserController')

module.exports = (app) => {

  // Home Page
  app.get('/',
    IndexController.home)

  // INGREDIENT-RELATED
  app.get('/view-ingredient/:ingredient_id',
    IngredientController.viewIngredient)
  app.get('/view-ingredients',
    IngredientController.viewAllIngredients)
  app.post('/add-ingredient',
    IngredientController.addIngredient)
  app.put('/update-ingredient/:ingredient_id',
    IngredientController.updateIngredient)
  app.delete('/delete-ingredient/:ingredient_id',
    IngredientController.deleteIngredient)

  // MEAL-RELATED
  app.get('/view-meal/:meal_id',
    MealController.viewMeal)
  app.get('/view-meals',
    MealController.viewAllMeals)
  app.post('/add-meal',
    MealController.addMeal)
  app.put('/update-meal/:meal_id',
    MealController.updateMeal)
  app.delete('/delete-meal/:meal_id',
    MealController.deleteMeal)
  
  app.get('/view-ingredients-of-meal',
    MealController.viewIngredientsOfMeal)
  app.post('/add-ingredient-of-meal/:meal_id',
    MealController.addIngredientOfMeal)
  app.put('/update-ingredient-of-meal/:meal_id',
    MealController.updateIngredientOfMeal)
  app.delete('/delete-ingredient-of-meal/:meal_id',
    MealController.deleteIngredientOfMeal)

  // USER-RELATED
  app.get('/users-listing',
    UserController.usersListing)
}